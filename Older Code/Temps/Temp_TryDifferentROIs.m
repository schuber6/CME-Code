for i=2:5
BackR=i;
figure
load('E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS_ManSel.mat');
movie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS.tif';
NewU=[];
NewL=[];
NewD=[];
Newt=[];
for i2=1:length(Sevents)
    [Is,Bs]=ManualFitEvents_BackR(Sevents{i2},movie,BackR);
    [Upper,Lower,Drop,t]=FindBiggestDrop(Is);
    NewU(i2)=Upper;
    NewL(i2)=Lower;
    NewD(i2)=Drop;
    Newt(i2)=t;
end
scatter(NewU,NewL,[],'r')
title(num2str(i))
end