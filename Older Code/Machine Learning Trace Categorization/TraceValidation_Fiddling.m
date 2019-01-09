clear
file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
savefile='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1_ManualDecisions.mat';
load(file)
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
for i=1:length(imfinfo(movie))
    IM(:,:,i)=imread(movie,'Index',i);
end
%%
% Decisions=[];
% save(savefile,'Decisions')

%%
used=[];
for i=1:length(Threshfxyc(1,1,:))
    if max(Threshfxyc(:,1,i))<length(IM(1,1,:)) && ...
            min(nonzeros(Threshfxyc(:,1,i)))>1 && ...
            length(nonzeros(Threshfxyc(:,1,i)))>=4
        used=[used i];
    end
end

%%
load(savefile)
for i=1:300
    T=used(ceil(rand*length(used)));
    if isempty(Decisions) || isempty(find(Decisions(:,1)==T))
        used2=find(Threshfxyc(:,1,T));
        trace=Threshfxyc(used2,:,T);
        Decisions(end+1,1)=T;
        Decisions(end,2)=TraceValidation(trace,IM);
        i
    end
end
save(savefile,'Decisions')

%%
for i=1:length(Decisions(:,1))
    if Decisions(i,2)==33
        Decisions(i,2)=3;
    end
end

%%
load(savefile)
CME=Decisions(:,1);
for i=1:length(Decisions(:,1))
    T=Decisions(i,1);
    CME(i,2)=Threshfxyc(1,4,T);
end
save(savefile,'Decisions','CME')

%%

for i=1:4
    for i2=1:4
        used=find(Decisions(:,2)==i & CME(:,2)==i2);
        Occ(i,i2)=length(used);
    end
end