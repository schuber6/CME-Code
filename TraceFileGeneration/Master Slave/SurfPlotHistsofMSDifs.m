function [InterM,InterS,MSDifs,MM,MS,MD]=SurfPlotHistsofMSDifs(fxycMS)

ML=10;

MSDifs=cell(1,101);
InterM=cell(1,101);
InterS=cell(1,101);
Ts=length(fxycMS(1,1,:));
for i=1:Ts
    used=find(fxycMS(:,1,i));
    L=length(used);
    if L>=ML
        Mast=fxycMS(used,9,i);
        Mast=Mast/max(Mast);
        Slave=fxycMS(used,6,i);
        Slave=Slave/max(Slave);
        Frames=fxycMS(used,1,i);
        Xp=(Frames-Frames(1))/(max(Frames)-Frames(1))*100;
        SI=interp1(Xp,Slave,0:100);
        MI=interp1(Xp,Mast,0:100);
        for i2=1:length(SI)
            InterM{i2}=[InterM{i2} MI(i2)];
            InterS{i2}=[InterS{i2} SI(i2)];
            MSDifs{i2}=[MSDifs{i2} MI(i2)-SI(i2)];
        end
    end
end
xbins=-1:.05:1;
SM=[];
SS=[];
SD=[];
SX=xbins;
SY=0:length(InterM)-1;
for i=1:length(InterM)
    MM(i)=mean(InterM{i});
    MS(i)=mean(InterS{i});
    MD(i)=mean(MSDifs{i});
    HM{i}=hist(InterM{i},xbins);
    HS{i}=hist(InterS{i},xbins);
    HD{i}=hist(MSDifs{i},xbins);
    SM=[SM ; HM{i}];
    SS=[SS ; HS{i}];
    SD=[SD ; HD{i}];
end
% plot(MM/max(MM),'g')
% hold on
% plot(MS/max(MS),'r')
% plot(MD,'b')
surf(SX,SY,SS)

