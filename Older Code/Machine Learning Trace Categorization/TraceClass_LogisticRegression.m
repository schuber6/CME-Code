clear
load('MLData_ExtraFrame_R2_Split.mat')
Ls=[0 .01 .03 .1 .3 1 3 10];
NBins=20;
[X,yBeg,yEnd,LN,AN]=ConstructFeatures(trainData,NBins);
[Xcv,yBegcv,yEndcv]=ConstructFeatures(CVData,NBins,LN,AN);
for i=1:length(Ls)
    lambda=Ls(i);
    Theta=RegLogisticResgression(X,yEnd,lambda);
    [ErrT(i),~]=LRErrorRate(X,yEnd,Theta);
    [ErrCV(i),~]=LRErrorRate(Xcv,yEndcv,Theta);
end
figure
subplot(1,2,1)
plot(ErrT)
hold on
plot(ErrCV)
for i=1:length(Ls)
    lambda=Ls(i);
    Theta=RegLogisticResgression(X,yBeg,lambda);
    [ErrT(i),~]=LRErrorRate(X,yBeg,Theta);
    [ErrCV(i),~]=LRErrorRate(Xcv,yBegcv,Theta);
end
subplot(1,2,2)
plot(ErrT)
hold on
plot(ErrCV)

%%
load('MLData_ExtraFrame_R2_Split.mat')
clear ErrTb ErrCVb ErrTe ErrCVe
lambda=0.1;
NBins=20;
for i=1:length(NBins)
    [X,yBeg,yEnd,LN,AN]=ConstructFeatures(trainData,NBins(i));
    [Xcv,yBegcv,yEndcv]=ConstructFeatures(CVData,NBins(i),LN,AN);
    Theta=RegLogisticResgression(X,yEnd,lambda);
    [ErrTe(i),preTE,ErrVTe]=LRErrorRate(X,yEnd,Theta);
    [ErrCVe(i),preE,preEV]=LRErrorRate(Xcv,yEndcv,Theta);
    ThetaE=Theta;
    
    Theta=RegLogisticResgression(X,yBeg,lambda);
    [ErrTb(i),preTB,ErrVTb]=LRErrorRate(X,yBeg,Theta);
    [ErrCVb(i),preB,preBV]=LRErrorRate(Xcv,yBegcv,Theta);
    ThetaB=Theta;
    
    [Err,~]=FullErrorRate(preB,preE,[CVData.Decision]);
end


Err
% figure
% plot(NBins,ErrCVb,'g')
% hold on
% plot(NBins,ErrCVe,'r')
% plot(NBins,ErrTb,'g--')
% plot(NBins,ErrTe,'r--')
% Error around 21%

%%

% used=find(ErrVTb);
% t=used(ceil(rand*length(used)));
file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
load(file)
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
for i=1:length(imfinfo(movie))
    IM(:,:,i)=imread(movie,'Index',i);
end
%%
t=ceil(rand*1200);
T=trainData(t).T;
D=trainData(t).Decision;
CME=trainData(t).CMED;
C=CombinedCategory(preTB(t),preTE(t));
tit=strcat('(Decision,CME,LR)=(',num2str(D),',',num2str(CME),',',num2str(C),')');

trace=Threshfxyc(:,:,T);
Fs=trainData(t).frame;
As=trainData(t).A;
u=find(trace(:,1));
trace=trace(u,:);
TraceInspection(trace,IM,tit,Fs,As);

STrace=ScottifyTrace(As,NBins);
CategorizeExample([1 length(As) STrace])
% %ErrVTb(t)
% preTB(t)
% preTE(t)
% [B,E]=SeparateCategory(D)

%%
for i=1:length(preTB)
    Cs(i)=CombinedCategory(preTB(i),preTE(i));
end
Ds=[trainData.Decision];
sum(Cs~=Ds)/length(Ds)
for i=1:length(preB)
    Cscv(i)=CombinedCategory(preB(i),preE(i));
end
Dscv=[CVData.Decision];
sum(Cscv~=Dscv)/length(Dscv)
%%
A=zeros(4);
for i=1:length(Cs)
    A(Cs(i),Ds(i))=A(Cs(i),Ds(i))+1;
end
%%
Acv=zeros(4);
for i=1:length(Cscv)
    Acv(Cscv(i),Dscv(i))=Acv(Cscv(i),Dscv(i))+1;
end
