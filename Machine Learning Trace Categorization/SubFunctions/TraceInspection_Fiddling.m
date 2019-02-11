file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
Data=FXYC2Data(movie,file);
NBins=30;
[X,yBeg,yEnd]=ConstructFeatures(Data,NBins,3);

%%
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
for i=1:length(imfinfo(movie))
    IM(:,:,i)=imread(movie,'Index',i);
end
%%
framegap=60;
MedI=1;
file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';

load(file)
used0=find([Data.CMED]==3);
I=ceil(rand*length(used));
T=Data(used0(I)).T;
trace=Threshfxyc(:,:,T);
used=find(trace(:,1));
trace=trace(used,:);
C=CategorizeExample(X(I,:),framegap,MedI);
TraceInspection2(trace,IM,num2str(C))
% figure
% plot(X(used0(I),3:end))