clear
file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
savefile='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1_MultiHumpCategorization_190226.mat';
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
framegap=3;
Data=FXYC2Data(movie,file,framegap);
load(savefile)
%%
F1min=0;
MinL=7;
for i=1:length(Decisions(:,1))
    I=find([Data.T]==Decisions(i,1));
    if ~isempty(I)
    Itrace=Data(I).A;
    [Split(i),Forig(i),Fnew(i,:)]=FindBestSplit(Itrace,framegap,F1min);
    Lmin(i)=min([Split(i) length(Itrace)-Split(i)+1]);
    if Split(i)<=MinL || Split(i)>=length(Itrace)-MinL+1
        Split(i)=0;
    end
    end
end

%%
Fmins=min(Fnew,[],2);
Fmaxs=max(Fnew,[],2);
used2=find(Decisions(:,2)==2);
used1=find(Decisions(:,2)==1);
Fmi{1}=Fmins(used1);
Fmi{2}=Fmins(used2);
Fma{1}=Fmaxs(used1);
Fma{2}=Fmaxs(used2);
Lmi{1}=Lmin(used1);
Lmi{2}=Lmin(used2);
%%
bins=0:.01:1;
figure
subplot(1,2,1)
hist(Fmi{1},bins)
subplot(1,2,2)
hist(Fmi{2},bins)
%%
bins=0:.01:1;
figure
subplot(1,2,1)
hist(Fma{1},bins)
subplot(1,2,2)
hist(Fma{2},bins)
%%
bins=0:1:20;
figure
subplot(1,2,1)
hist(Lmi{1},bins)
subplot(1,2,2)
hist(Lmi{2},bins)
%%
figure
subplot(1,2,1)
scatter(Lmi{1},Fma{1})
subplot(1,2,2)
scatter(Lmi{2},Fma{2})

%%
ind=1;
D2=[];
for i=1:length(Decisions(:,1))
    used=find([Data.T]==Decisions(i,1));
    if ~isempty(used)
    D2(ind,1)=used(1);
    D2(ind,2)=Decisions(i,2);
    D2(ind,3)=Split(i);
    ind=ind+1;
    end
end
%%
used=find(D2(:,3)==0);%& [DataTrain.CMED]==3);
figure
for i=1:10
    subplot(4,5,i)
    I=used(ceil(rand*length(used)));
    Itrace=Data(D2(I,1)).A;
    Temp_PlotSplit(D2(I,3),Itrace);
    title(strcat(num2str(Forig(I)),',',num2str(Fmaxs(I))))

end
used=find(D2(:,3)~=0);% & [DataTrain.CMED]==3);
for i=1:10
    subplot(4,5,i+10)
    I=used(ceil(rand*length(used)));
    Itrace=Data(D2(I,1)).A;
    Temp_PlotSplit(D2(I,3),Itrace);
    title(strcat(num2str(Forig(I)),',',num2str(Fmaxs(I))))
end