function [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_EndAligned_MaxDecrease(fxycMS)

ML=10;
MInt=500;
MaxL=30;
MC=.6;
MDD=4;

MSDifs=cell(1,21);
InterM=cell(1,21);
InterS=cell(1,21);
Ts=length(fxycMS(1,1,:));
for i=1:Ts
    used=find(fxycMS(:,1,i));
    usedPrev=find(fxycMS(used,5,i)==0);
    usedPost=find(fxycMS(used,5,i));
    LPrev=length(usedPrev);
    LPost=length(usedPost);
    if LPost>=ML && max(fxycMS(:,9,i))>MInt && max(fxycMS(:,9,i))>=0 && fxycMS(1,4,i)==3
        Mast=fxycMS(used,9,i);
        Mast=Mast/max(Mast);
        Slave=fxycMS(used,6,i);
        Slave=Slave/max(Slave);
        T=FindMaxDecrease(Slave);
        T2=FindMaxDecrease(Mast);
        C=corr(Mast,Slave);
        
        if C>=MC && abs(T-T2)<=MDD
            Frames=fxycMS(used,1,i);
            %         Xp=(Frames-Frames(1))/(max(Frames)-Frames(1))*100;
            %         SI=interp1(Xp,Slave,0:100);
            %         MI=interp1(Xp,Mast,0:100);
            for i2=max(T-10,1):min(T+10,length(Mast));
              
                InterM{i2-T+11}=[InterM{i2-T+11} Mast(i2)];
                InterS{i2-T+11}=[InterS{i2-T+11} Slave(i2)];
                MSDifs{i2-T+11}=[MSDifs{i2-T+11} Mast(i2)-Slave(i2)];
            end
        end
    end
end
for i=1:length(InterM)
    MM(i)=sum(InterM{i})/length(InterM{i});
    MS(i)=sum(InterS{i})/length(InterS{i});
    MD(i)=mean(MSDifs{i});
end
MaM=mean(MM(1:3));
MiM=mean(MM(16:18));
MaS=mean(MS(1:3));
MiS=mean(MS(16:18));

MM=(MM-MiM)/(MaM-MiM);
MS=(MS-MiS)/(MaS-MiS);
t=-30:3:30;
figure
plot(t,MM,'g')
hold on
plot(t,MS,'r')
%plot(MD,'b')
xlim([-30 20])
ylim([-.5 1.5])

