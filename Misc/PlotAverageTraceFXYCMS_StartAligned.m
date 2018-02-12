function PlotAverageTraceFXYCMS_StartAligned(fxycMS)

L=50;
MF=10;
MA=500;
CMast=cell(1,50);
CSlave=cell(1,50);
for T=1:length(fxycMS(1,1,:))
    Frames=nonzeros(fxycMS(:,1,T));
    Amps=fxycMS(:,5,T);
    if length(Frames)>=MF && max(Amps)>=MA
        Mast=fxycMS(:,9,T);
        Slave=fxycMS(:,6,T);
        used=find(fxycMS(:,1,T),L,'first');
        for i2=1:length(used)
            CMast{i2}=[CMast{i2} Mast(used(i2))];
            CSlave{i2}=[CSlave{i2} Slave(used(i2))];
        end
    end
end
for i=1:L
    MastAV(i)=mean(CMast{i});
    SlaveAV(i)=mean(CSlave{i});
%     MastAV(i)=sum(CMast{i})/length(CMast{1});
%     SlaveAV(i)=sum(CSlave{i})/length(CSlave{1});
end
plot(MastAV/max(MastAV),'g')
hold on
plot(SlaveAV/max(SlaveAV),'r')
legend('CALM','CLCa')
xlabel('Frames from start of trace (1 frame=3s)')