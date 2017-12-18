function [InterM,InterS,MSDifs,MM,MS,MD,xf]=PlotAvTraces_BothAligned_PreserveLT(fxycMS,blue,MinScale,MScale,SScale)

if ~isempty(fxycMS)
ML=10;

MSDifs=cell(1,101);
InterM=cell(1,101);
InterS=cell(1,101);
Ts=length(fxycMS(1,1,:));
LTs=[];
for i=1:Ts
    used=find(fxycMS(:,1,i));
    L=length(used);
    LTs=[LTs L];
    if L>=ML && max(fxycMS(:,6,i))>0
        Mast=fxycMS(used,9,i);
        
        Slave=fxycMS(used,6,i);
        if SScale==0
            Slave=Slave/max(Slave);
        else
            Slave=Slave/SScale;
        end
        if MScale==0
            Mast=Mast/max(Mast);
        else
            Mast=Mast/MScale;
        end
        Frames=fxycMS(used,1,i);
        Xp=(Frames-Frames(1))/(max(Frames)-Frames(1))*100;
        SI=interp1(Xp,Slave,0:100);
        MI=interp1(Xp,Mast,0:100);
        for i2=1:length(SI)
            InterM{i2}=[InterM{i2} MI(i2)];
            InterS{i2}=[InterS{i2} SI(i2)];
            MSDifs{i2}=[MSDifs{i2} MI(i2)/SI(i2)];
        end
    end
end
for i=1:length(InterM)
    MM(i)=mean(InterM{i});
    MS(i)=mean(InterS{i});
    MD(i)=median(MSDifs{i});
end
if MinScale
    MM=(MM-min(MM))/(max(MM)-min(MM));
    MS=(MS-min(MS))/(max(MS)-min(MS));
else
    if MScale==0
        MM=MM/max(MM);
    end
    if SScale==0
        MS=MS/max(MS);
    end
end
xf=0:length(MM)-1;
xf=xf/(length(MM)-1)*mean(LTs);

plot(xf,MM,'g')
hold on
plot(xf,MS,'r')
maxV=max([MM MS]);
ylim([0 maxV*1.1])
if blue
plot(MD*100,'b')
end
else
    InterM=[];
    InterS=[];
    MSDifs=[];
    MM=[];
    MS=[];
    MD=[];
end

