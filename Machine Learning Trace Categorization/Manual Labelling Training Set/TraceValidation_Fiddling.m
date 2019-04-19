clear
% file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
% savefile='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1_ManualDecisions_ML.mat';
% movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
% file='E:\CME Superfolder\CME Data\190111_Analysis\50ms\orig_movies\cell008_C1.mat';
% savefile='E:\CME Superfolder\CME Data\190111_Analysis\50ms\orig_movies\cell008_C1_ManualDecisions.mat';
% movie='E:\CME Superfolder\CME Data\190111_Analysis\50ms\orig_movies\cell008_C1.tif';
% file='E:\CME Superfolder\CME Data\190111_Analysis\50ms\orig_movies\cell015_C1.mat';
% savefile='E:\CME Superfolder\CME Data\190111_Analysis\50ms\orig_movies\cell015_C1_ManualDecisions.mat';
% movie='E:\CME Superfolder\CME Data\190111_Analysis\50ms\orig_movies\cell015_C1.tif';
% file='E:\CME Superfolder\CME Data\190111_Analysis\200ms\orig_movies\cell005_C1.mat';
% savefile='E:\CME Superfolder\CME Data\190111_Analysis\200ms\orig_movies\cell005_C1_ManualDecisions.mat';
% movie='E:\CME Superfolder\CME Data\190111_Analysis\200ms\orig_movies\cell005_C1.tif';
file='E:\CME Superfolder\CME Data\190111_Analysis\200ms\orig_movies\cell010_C1.mat';
savefile='E:\CME Superfolder\CME Data\190111_Analysis\200ms\orig_movies\cell010_C1_ManualDecisions.mat';
movie='E:\CME Superfolder\CME Data\190111_Analysis\200ms\orig_movies\cell010_C1.tif';
% file='E:\CME Superfolder\CME Data\190111_Analysis\100ms\orig_movies\cell_C1.mat';
% savefile='E:\CME Superfolder\CME Data\190111_Analysis\100ms\orig_movies\cell_C1_ManualDecisions.mat';
% movie='E:\CME Superfolder\CME Data\190111_Analysis\100ms\orig_movies\cell_C1.tif';
load(file)

for i=1:length(imfinfo(movie))
    IM(:,:,i)=imread(movie,'Index',i);
end
framegap=1;
Data=FXYC2Data(movie,file,framegap);
NBins=20;

[X,~,~]=ConstructFeatures_SAV(Data,NBins,framegap);
ML=CategorizeExample_new(X,60,1);
used=[Data.T];
%%
Decisions=struct([]);
CME=[];
save(savefile,'Decisions')

%%
% used=[];
% for i=1:length(Threshfxyc(1,1,:))
%     if max(Threshfxyc(:,1,i))<length(IM(1,1,:)) && ...
%             min(nonzeros(Threshfxyc(:,1,i)))>1 && ...
%             length(nonzeros(Threshfxyc(:,1,i)))>=4
%         used=[used i];
%     end
% end

%%
load(savefile)
for i=1:100
    I=ceil(rand*length(used));
    T=used(I);
    if isempty(Decisions) || isempty(find([Decisions.T]==T))
        C2(i)=Data(I).CMED;
        MLC=ML(I);
        used2=find(Threshfxyc(:,1,T));
        trace=Threshfxyc(used2,:,T);
        Decisions(end+1).T=T;
        if C2(i)~=MLC
            Decisions(end).D=TraceValidation(trace,IM);
        else
            Decisions(end).D=C2(i);
        end
        %CME(end+1,1)=T;
        Decisions(end).CMED=C2(i);
        Decisions(end).MLD=MLC;
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