clear
file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
load(file)
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
for i=1:length(imfinfo(movie))
    IM(:,:,i)=imread(movie,'Index',i);
end
Data=FXYC2Data(movie,file,3,4);
NBins=20;
medInorm=0;
[X,yBeg,yEnd]=ConstructFeatures_SAV_DifMovs(Data,NBins,medInorm);
[ML,B,E,F1]=CategorizeExample_new(X);
for i=1:length(ML)
    Data(i).ML=ML(i);
    Data(i).F1=F1(i);
end
%%
used=find([Data.ML]==3 & [Data.CMED]~=3);
Data3=Data(used);

T = struct2table(Data3); % convert the struct array to a table
sortedT = sortrows(T, 'F1','descend'); % sort the table by 'DOB'
Data3 = table2struct(sortedT); % change it back to struct array if necessary

%%

t=ceil(2);
T=Data3(t).T;
CME=Data3(t).CMED;
C=Data3(t).ML;
tit=strcat('(Decision,CME,LR)=(',',',num2str(CME),',',num2str(C),')');

trace=Threshfxyc(:,:,T);
Fs=Data3(t).frame;
As=Data3(t).A;
u=find(trace(:,1));
trace=trace(u,:);
TraceInspection(trace,IM,tit,Fs,As);

%%
T = struct2table(Data); % convert the struct array to a table
sortedT = sortrows(T, 'F1','descend'); % sort the table by 'DOB'
Datasort = table2struct(sortedT);
%%
clear traces
ranges=.5:.05:1;
for i=1:length(ranges)-1
    used=find([Data.F1]>ranges(end-i) & [Data.F1]<=ranges(end-i+1));
    traces{i}={Data(used).A};
    for i2=1:5
        SuperSubplot(i2+(i-1)*5)
        r=used(ceil(rand*length(used)));
        plot(Data(r).A)
        title(num2str(Data(r).F1))
    end
end
%%
figure
for i=1:length(ranges)-1
    subplot(2,5,i)
    [~]=ScottifyAverageTrace(traces{i},50,1,0);
    ylim([0 600])
end