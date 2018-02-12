function [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BeginningAligned_wPrev(fxycMS)

ML=10;
MInt=400;
MaxL=30;

MSDifs=cell(1,100);
InterM=cell(1,100);
InterS=cell(1,100);
Ts=length(fxycMS(1,1,:));
for i=1:Ts
    used=find(fxycMS(:,1,i));
    usedPrev=find(fxycMS(used,5,i)==0);
    usedPost=find(fxycMS(used,5,i));
    LPrev=length(usedPrev);
    LPost=length(usedPost);
    if LPrev>=ML && LPost>=ML && max(fxycMS(:,6,i))>0 && max(fxycMS(:,9,i))>=0 && fxycMS(1,4,i)==3
        Mast=fxycMS(used,9,i);
        Mast=Mast/max(Mast);
        Slave=fxycMS(used,6,i);
        Slave=Slave/max(Slave);
        Frames=fxycMS(used,1,i);
        Xp=(Frames-Frames(1))/(max(Frames)-Frames(1))*100;
        SI=interp1(Xp,Slave,0:100);
        MI=interp1(Xp,Mast,0:100);
        for i2=1:min(length(Mast),100)
            InterM{i2}=[InterM{i2} Mast(i2)];
            InterS{i2}=[InterS{i2} Slave(i2)];
            MSDifs{i2}=[MSDifs{i2} Mast(i2)-Slave(i2)];
        end
    end
end
for i=1:length(InterM)
    MM(i)=sum(InterM{i})/length(InterM{i});
    MS(i)=sum(InterS{i})/length(InterS{i});
    MD(i)=mean(MSDifs{i});
end
t=1:100;
t=(t-11)*3;
figure
plot(t,(MM-min(MM))/(max(MM)-min(MM)),'g')
hold on
plot(t,(MS-min(MS))/(max(MS)-min(MS)),'r')
%plot(t,MD,'b')
xlim([-30 30])

