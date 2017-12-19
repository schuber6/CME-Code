
BackR=3;
AllU=[];
AllL=[];
AllS=[];
SaveFile='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\171026_BestSel.mat';
figure
load('E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS_ManSel.mat')
movie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS.tif';
if exist(SaveFile)~=0
    load(SaveFile)
end
for i2=1:length(Sevents)
    DisplaySelData(Sevents,i2,movie)
    IN=input('Good? (-1 for skip movie)');
    close
    if IN==-1
        break
    end
    if IN
        [Is,Bs]=ManualFitEvents_BackR(Sevents{i2},movie,BackR);
        [Upper,Lower,Drop,t]=FindBiggestDrop(Is);
%         NewU(i2)=Upper;
%         NewL(i2)=Lower;
%         NewD(i2)=Drop;
%         Newt(i2)=t;
        AllU=[AllU Upper];
        AllL=[AllL Lower];
        
        AllS(end+1).events=Sevents{i2};
        AllS(end).Is3=Is;
        AllS(end).Up=Upper;
        AllS(end).Low=Lower;
        AllS(end).t=t;
        AllS(end).Drop=Drop;
        AllS(end).Movie=movie;
        AllS(end).Exp=8;
        AllS(end).check=1;
    end
end
scatter([AllS.Up]./[AllS.Exp],[AllS.Low]./[AllS.Exp],[],'r')
%scatter(SUppers,SLowers,[],'r')
hold on
load('E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\030_BS_ManSel.mat')
movie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\030_BS.tif';
for i2=1:length(Sevents)
    DisplaySelData(Sevents,i2,movie)
    IN=input('Good?');
    close
    if IN==-1
        break
    end
    if IN
        [Is,Bs]=ManualFitEvents_BackR(Sevents{i2},movie,BackR);
        [Upper,Lower,Drop,t]=FindBiggestDrop(Is);
%         NewU(i2)=Upper;
%         NewL(i2)=Lower;
%         NewD(i2)=Drop;
%         Newt(i2)=t;
        AllU=[AllU Upper];
        AllL=[AllL Lower];
        AllS(end+1).events=Sevents{i2};
        AllS(end).Is3=Is;
        AllS(end).Up=Upper;
        AllS(end).Low=Lower;
        AllS(end).t=t;
        AllS(end).Drop=Drop;
        AllS(end).Movie=movie;
        AllS(end).Exp=8;
        AllS(end).check=1;
    end
end
scatter([AllS.Up]./[AllS.Exp],[AllS.Low]./[AllS.Exp],[],'r')
%scatter(SUppers,SLowers,[],'b')
load('E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\050_BS_ManSel.mat')
movie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\050_BS.tif';
for i2=1:length(Sevents)
    DisplaySelData(Sevents,i2,movie)
    IN=input('Good?');
    close
    if IN==-1
        break
    end
    if IN
        [Is,Bs]=ManualFitEvents_BackR(Sevents{i2},movie,BackR);
        [Upper,Lower,Drop,t]=FindBiggestDrop(Is);
%         NewU(i2)=Upper;
%         NewL(i2)=Lower;
%         NewD(i2)=Drop;
%         Newt(i2)=t;
        AllU=[AllU 2*Upper];
        AllL=[AllL 2*Lower];
        AllS(end+1).events=Sevents{i2};
        AllS(end).Is3=Is;
        AllS(end).Up=Upper;
        AllS(end).Low=Lower;
        AllS(end).t=t;
        AllS(end).Drop=Drop;
        AllS(end).Movie=movie;
        AllS(end).Exp=4;
        AllS(end).check=1;
    end
end
scatter([AllS.Up]./[AllS.Exp],[AllS.Low]./[AllS.Exp],[],'r')
Sing=FindBestFitPBint([AllS.Up]./[AllS.Exp],[AllS.Low]./[AllS.Exp],2);
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
% BD=[];
% for i=1:length([AllS.Up]./[AllS.Exp])
%     difs=[([AllS.Up]./[AllS.Exp])(i)-[AllS.Low]./[AllS.Exp](i)-sing  [AllS.Up]./[AllS.Exp](i)-[AllS.Low]./[AllS.Exp](i)-2*sing [AllS.Up]./[AllS.Exp](i)-[AllS.Low]./[AllS.Exp](i)-3*sing];
%     absdifs=[abs([AllS.Up]./[AllS.Exp](i)-[AllS.Low]./[AllS.Exp](i)-sing)  abs([AllS.Up]./[AllS.Exp](i)-[AllS.Low]./[AllS.Exp](i)-2*sing) abs([AllS.Up]./[AllS.Exp](i)-[AllS.Low]./[AllS.Exp](i)-3*sing)];
%     best=find(absdifs==min(absdifs));
%     BD(i)=difs(best(1));
% end
% hist(BD,25)
save(SaveFile,'AllS')