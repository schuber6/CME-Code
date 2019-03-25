clear
file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
savefile='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1_MultiHumpCategorization_190226.mat';
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
[C,B,E,F1,Data]=ClassifyTraces(file,movie);

%%
L=length(imfinfo(movie));
for i=1:L
    IM(:,:,i)=imread(movie,'Index',i);
end
%%
load(file)
good=find(C==3);
goodcme=find(Threshfxyc(1,4,:)==3);
%%
load(file)
for i0=1:10
i=ceil(rand*length(good));
T=Data(good(i)).T;
trace=Threshfxyc(:,:,T);
used=find(trace(:,1));
trace=trace(used,:);
Decision=TraceValidation(trace,IM)
end
%%  Initialize save file
% savefile='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1_MultiHumpCategorization_190226.mat';
% Decisions=[];
% save(savefile,'Decisions')
%%
savefile='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1_MultiHumpCategorization_190226.mat';
load(savefile)
for i0=1:30
    i=ceil(rand*length(goodcme));
    T=goodcme(i);
    if isempty(Decisions) || isempty(find(Decisions(:,1)==T))
        trace=Threshfxyc(:,:,T);
        used=find(trace(:,1));
        trace=trace(used,:);
        Decisions(end+1,2)=TraceValidation(trace,IM);
        Decisions(end,1)=T;
    end
end
save(savefile,'Decisions')