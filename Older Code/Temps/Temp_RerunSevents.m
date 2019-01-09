BackR=3;
AllU=[];
AllL=[];
figure
load('E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS_ManSel.mat')
movie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS.tif';
for i2=1:length(Sevents)
    [Is,Bs]=ManualFitEvents_BackR(Sevents{i2},movie,BackR);
    [Upper,Lower,Drop,t]=FindBiggestDrop(Is);
    NewU(i2)=Upper;
    NewL(i2)=Lower;
    NewD(i2)=Drop;
    Newt(i2)=t;
    AllU=[AllU Upper];
    AllL=[AllL Lower];
end
scatter(NewU,NewL,[],'r')
%scatter(SUppers,SLowers,[],'r')
hold on
load('E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\030_BS_ManSel.mat')
movie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\030_BS.tif';
for i2=1:length(Sevents)
    [Is,Bs]=ManualFitEvents_BackR(Sevents{i2},movie,BackR);
    [Upper,Lower,Drop,t]=FindBiggestDrop(Is);
    NewU(i2)=Upper;
    NewL(i2)=Lower;
    NewD(i2)=Drop;
    Newt(i2)=t;
    AllU=[AllU Upper];
    AllL=[AllL Lower];
end
scatter(NewU,NewL,[],'g')
%scatter(SUppers,SLowers,[],'b')
load('E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\050_BS_ManSel.mat')
movie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\050_BS.tif';
for i2=1:length(Sevents)
    [Is,Bs]=ManualFitEvents_BackR(Sevents{i2},movie,BackR);
    [Upper,Lower,Drop,t]=FindBiggestDrop(Is);
    NewU(i2)=Upper;
    NewL(i2)=Lower;
    NewD(i2)=Drop;
    Newt(i2)=t;
    AllU=[AllU 2*Upper];
    AllL=[AllL 2*Lower];
end
scatter(NewU*2,NewL*2,[],'b')
Sing=FindBestFitPBint(AllU,AllL,3);
%scatter(SUppers*2,SLowers*2,[],'g')
XL=xlim;
YL=ylim;
sing=Sing %13000;
for i=1:3
    y(i,1)=XL(1)-sing*i;
    y(i,2)=XL(2)-sing*i;
    line(XL,y(i,:))
end
xlim(XL)
ylim(YL)
figure
BD=[];
for i=1:length(AllU)
    difs=[AllU(i)-AllL(i)-sing  AllU(i)-AllL(i)-2*sing AllU(i)-AllL(i)-3*sing];
    absdifs=[abs(AllU(i)-AllL(i)-sing)  abs(AllU(i)-AllL(i)-2*sing) abs(AllU(i)-AllL(i)-3*sing)];
    best=find(absdifs==min(absdifs));
    BD(i)=difs(best(1));
end
hist(BD,25)