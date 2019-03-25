clear all
NBins=20;
medInorm=0;

file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
Data=FXYC2Data(movie,file,3);
[X,yBeg,yEnd]=ConstructFeatures_SAV_DifMovs(Data,NBins,medInorm);
[ML,B,E,F1]=CategorizeExample_new(X);
CME=[Data.CMED];
%%
Con=zeros(4);
for i=1:length(ML)
    Con(ML(i),CME(i))=Con(ML(i),CME(i))+1;
end
%%
clear IM
for i=1:length(imfinfo(movie))
    IM(:,:,i)=imread(movie,'Index',i);
end
%%  Plot 4 category disagreements of both types
load(file)
MLGood=find(ML==3 & CME~=3);
CMEGood=find(CME==3 & ML~=3);
MT=[Data(MLGood).T];
CT=[Data(CMEGood).T];

for i=1:5
    I=ceil(rand*length(MT));
    fxyc=Threshfxyc(:,:,MT(I));
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    TraceInspection2(fxyc,IM,'')
end
for i=1:5
    I=ceil(rand*length(CT));
    fxyc=Threshfxyc(:,:,CT(I));
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    TraceInspection2(fxyc,IM,'')
end

% figure
% for i=1:16
%     subplot(4,4,i)
%     I=ceil(rand*length(MT));
%     fxyc=Threshfxyc(:,:,MT(I));
%     used=find(fxyc(:,1));
%     fxyc=fxyc(used,:);
%     plot(fxyc(:,1),fxyc(:,5))
%     %TraceInspection2(fxyc,IM,'')
% end
% figure
% for i=1:16
%     subplot(4,4,i)
%     I=ceil(rand*length(CT));
%     fxyc=Threshfxyc(:,:,CT(I));
%     used=find(fxyc(:,1));
%     fxyc=fxyc(used,:);
%     plot(fxyc(:,1),fxyc(:,5))
%     %TraceInspection2(fxyc,IM,'')
% end

%%
MLT=[F1 ; [Data.T] ; B ; E].';
CLT=[[Data.CMED] ; [Data.T] ; B ; E].';
S=sortrows(MLT,'desc');

for i=1:25
    SuperSubplot(i)
    fxyc=Threshfxyc(:,:,S(i,2));
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    plot(fxyc(:,1),fxyc(:,5));
end
used0=find(CLT(:,1)==3);
for i=1:25
    SuperSubplot(i)
    I=used0(ceil(rand*length(used0)));
    fxyc=Threshfxyc(:,:,CLT(I,2));
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    plot(fxyc(:,1),fxyc(:,5));
end
    
%%

