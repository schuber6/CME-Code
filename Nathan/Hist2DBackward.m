filesb={'data/b001.mat','data/b006.mat','data/b01.mat','data/b02.mat','data/b03.mat','data/b2.mat','data/b3.mat'};
filesa={'data/a001.mat','data/a006.mat','data/a01.mat','data/a02.mat','data/a03.mat','data/a2.mat','data/a3.mat'};
filestf=[2,2,2,3,3,4,4];

hbI=[];
hbT=[];
for(i=1:length(filesb))
    i
    load(filesb{i})
    [fxyac,traces]=gapFill(Threshfxyc,filestf(i));
    
    for(j=1:size(fxyac,3))
        if(fxyac(1,4,j)==3)
            list=find(squeeze(fxyac(:,4,j)));
            temp=squeeze(fxyac(list,5,j));
            temp=temp-min(temp);
            temp=temp/max(temp);
            
            temp2=[0:length(list)-1]*filestf(i)+1;
            temp2=temp2-max(temp2);
            
            hbT(end+1:end+length(list)) = temp2;
            hbI(end+1:end+length(list)) = temp;
        end
    end
end

haI=[];
haT=[];
for(i=1:length(filesa))
    i
    load(filesa{i})
    [fxyac,traces]=gapFill(Threshfxyc,filestf(i));
    
    for(j=1:size(fxyac,3))
        if(fxyac(1,4,j)==3)
            list=find(squeeze(fxyac(:,4,j)));
            temp=squeeze(fxyac(list,5,j));
            temp=temp-min(temp);
            temp=temp/max(temp);
            
            temp2=[0:length(list)-1]*filestf(i)+1;
            temp2=temp2-max(temp2);
            
            haT(end+1:end+length(list)) = temp2;
            haI(end+1:end+length(list)) = temp;
        end
    end
end

list=find(hbI==1);
hbI(list)=[];
hbT(list)=[];

list=find(hbT<-100);
hbI(list)=[];
hbT(list)=[];

list=find(haI==1);
haI(list)=[];
haT(list)=[];

list=find(haT<-100);
haI(list)=[];
haT(list)=[];

'done'


