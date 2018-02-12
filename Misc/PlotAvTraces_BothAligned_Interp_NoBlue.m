function [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp_NoBlue(fxycMS)

ML=10;

MSDifs=cell(1,101);
InterM=cell(1,101);
InterS=cell(1,101);
Ts=length(fxycMS(1,1,:));
for i=1:Ts
    used=find(fxycMS(:,1,i));
    L=length(used);
    if L>=ML && max(fxycMS(:,6,i))>0
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
for i=1:length(InterM)
    MM(i)=mean(InterM{i});
    MS(i)=mean(InterS{i});
    MD(i)=mean(MSDifs{i});
end
MM=(MM-min(MM))/(max(MM)-min(MM));
MS=(MS-min(MS))/(max(MS)-min(MS));

plot(MM,'g')
hold on
plot(MS,'r')
%plot(MD,'b')

