%createTraceLibrary: create groupings of intensity traces using hierachical
%                    clustering. Traces are compared by the custom metric
%                    trace_dist.  The output structure contains detailed
%                    information about the resulting clusters.
%   Inputs:
%       INT : a cell array of intensity trace vectors
%       tpf : time per frame of traces in seconds
%       num_clusters : This is the number of clusters which are created.
%                      It can be thought of as how tightly traces are
%                      confined to a group.  If all the traces are being
%                      assigned to a small number of clusters increase the
%                      number of clusters.  Conversely, if the traces are
%                      being distributed in small numbers to all of the
%                      clusters (ie no large clusters are forming) try
%                      decreasing the number.  Finding an appropriate value
%                      is a trial and error process.  Generally you want
%                      this number to be ~= number of traces/min_cluster_size.
%                      For more information see matlab documentation for
%                      the 'cluster' function.
%       min_cluster_size: we only report clusters which have at least
%                       min_cluster_size traces assigned to them.  We
%                       usually use 8.
%       bkgrd: Background. This is usually the same as the input from
%              comb_run. It is subtracted from all intensity traces, since it
%              is judged to be the lowest possible recordable signal.
%       plots: boolean whether or not to create plots
%   
%   Output:
%       clusters: output structure containing information about each
%                 resulting cluster which is over size greater than
%                 min_cluster_size
%           ave_tr:the average trace of the cluster which has been
%                  normalized to the average maximum intensity of the
%                  traces
%           LT  : the lifetime of the cluster in seconds
%           num : the number of traces in the cluster
%           max : the maximum intensity of the average trace (before
%                 normalization)
%           GR  : the list of all growth rates calculated from all traces in
%                 the cluster
%           GR13: the 13 bin normalized histogram of GR. This is the value used 
%                 for lookups
%           frac: the fraction of the total traces which this cluster
%                 represents
%           SD  : the standard deviation of the traces at each time point
%                 within the cluster.  This is used as a measure of how
%                 well it clustered like traces
%           norm: this is the average max intensity of all traces and the
%                 number by which the ave_tr is normalized
%           index: the index of the component traces of the cluster
%           
%
%
% Nathan Willy, Kural Group, Ohio State University, willy.2@osu.edu
%

function [clusters] = createTraceLibrary_Temp(INT,tpf,num_clusters,min_cluster_size,bkgrd,plots)

% close all

%this defines the bins of GR13
bins=[-.06:.01:.06];

%create output structure
clusters=struct('ave_tr',[],'LT',[],'num',[],'max',[],'GR',[],'GR13',[],'frac',[],'SD',[],'norm',[],'index',[]);

%convert intensity trace information into a single matrix with previously
%non-existant values being represented with zeros
[max_size, max_index] = max(cellfun('size', INT, 1));
traces = zeros(length(INT),max_size);
%create list of all maximum trace intensities
list_maxima = zeros(length(INT),1);
for(i=1:length(INT))
    traces(i,1:length(INT{i})) = INT{i};
    list_maxima(i) = max(INT{i});
end

%calculate normalization constant (average of intensity maxima)
normalization=mean(list_maxima);

%create the cluster tree using our custom metric 'trace_dist'
Z=linkage(traces,'complete','trace_dist');

%create clusters from the tree using num_clusters as a constraint
c=cluster(Z,'maxclust',num_clusters);

%determine how many traces were assigned to each cluster
[count,e]=hist(c,[1:max(c)]);

%plot histogram of how many traces were assigned to each cluster
%this is here to asssist in determining an appropriate value for
%num_clusters
if(plots)
    figure
    hist(c,e)
    xlabel('cluster number')
    ylabel('number of traces in cluster')
end


%find the clusters which are sufficiently large to be of interest
list_good_clusters=find(count>=min_cluster_size);

%list of the lifetimes of each cluster
LTlist=zeros(length(list_good_clusters),1);

index=1;
%loop through all such traces
for(i=1:length(list_good_clusters))

    
    %calculate the average trace of traces in the cluster
    temp = mean( traces(c==list_good_clusters(i),:) ,1);
    temp2 = temp(temp>min(min(traces(c==list_good_clusters(i),:))));
    
    
    if(length(temp2)<2)
        continue
    end
    
  
    %save the average trace to output structure using linear interpolation to create
    %a trace with a value every second
    clusters(i).ave_tr = interp1([1:length(temp2)],temp2,[1:1/tpf:length(temp2)]);
    
   
    %do the same for the standard deviation of the traces in the cluster
   
    temp = std( traces(c==list_good_clusters(i),:) ,1);
   
    temp2 = temp(temp~=0);
    clusters(i).SD = interp1([1:length(temp2)],temp2,[1:1/tpf:length(temp2)]);
    
    %save relevant information about the cluster to the output structure
    clusters(i).norm = normalization;
    clusters(i).LT = length(clusters(i).ave_tr);
    clusters(i).num = length(find(c==list_good_clusters(i)));
    clusters(i).frac = clusters(i).num/size(traces,1);
    clusters(i).max = max(clusters(i).ave_tr);
    clusters(i).ave_tr = clusters(i).ave_tr;%/clusters(i).norm;
    clusters(i).index = find(c==list_good_clusters(i));
    
    LTlist(i) = clusters(i).LT;
    NUMlist(i)=clusters(i).num;
    
    
    %find the list of traces within this cluster
    tr_list=find(c==list_good_clusters(i));

    %find all growth rate values of the traces within the cluster
    slope_cells = slope_finding(INT(tr_list),tpf,bkgrd);
    slope_list=[];
    for(q=1:length(slope_cells))
        temp_list=find(slope_cells{q});
        slope_list(end+1:end+length(temp_list)) = slope_cells{q}(temp_list);
    end
    clusters(i).GR = slope_list;
    
    %create and normalize GR13 for the current cluster
    [GR_c,GR_e]=hist(clusters(i).GR,bins);
    clusters(i).GR13 = GR_c/sum(GR_c);
    
end

%sort clusters in order od ascending lifetimes
[~,ind]=sort(NUMlist,'descend');
clusters(:)=clusters(ind);

%remove any empty cluster traces
for(i=length(clusters):-1:1)
    if(isempty(clusters(i).GR))
        clusters(i)=[];
    end
end

%display what fraction of traces were used in clusters
disp(strcat(num2str(sum(count(list_good_clusters))),'/',num2str(length(INT)),' traces (',num2str(sum(count(list_good_clusters))/length(INT)*100),'%) were clustered'))

%create cluster plots
%plot the first up to 36 clusters with the average cluster trace and standard
%deviations.  The titles include the number of traces in the cluster, the
%lifetime and the maximum (non-normalized) intensity
if(~plots)
    return
end
max_LT = clusters(end).LT+5;
start=0;
while(start<length(clusters))
    figure
    rows=min(ceil(sqrt(length(clusters)-start)),6);

    for(i=1+start:36+start)
        subplot(rows,rows,i-start)

        plot(1:clusters(i).LT,clusters(i).ave_tr,'b')
        hold on
        
        plot(1:clusters(i).LT,clusters(i).ave_tr + clusters(i).SD,'r')%/clusters(i).norm,'r')
        plot(1:clusters(i).LT,clusters(i).ave_tr - clusters(i).SD,'r')%/clusters(i).norm,'r')

        title({strcat('cluster ',num2str(i),' LT: ',num2str(clusters(i).LT),'s'),
            strcat('num: ',num2str(clusters(i).num),' MaxInt: ',num2str(round(clusters(i).max)))})
        xlim([0,max_LT])
        ylim([-normalization*2,normalization*2])

        if(i+1>length(clusters))
            break
        end
    end
    start=start+36;
end
