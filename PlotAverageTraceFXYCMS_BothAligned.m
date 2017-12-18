function PlotAverageTraceFXYCMS_BothAligned(fxycMS)

L=40;
MF=10;
MaxF=40;
MA=1000;
CMast=cell(1,L);
CSlave=cell(1,L);
for T=1:length(fxycMS(1,1,:))
    Frames=nonzeros(fxycMS(:,1,T));
    Amps=fxycMS(:,5,T);
    if length(Frames)>=MF && max(Amps)>=MA && length(Frames)<=MaxF
        Mast=fxycMS(:,9,T);
        Slave=fxycMS(:,6,T);
        used=find(fxycMS(:,1,T));
        for i2=1:length(used)
            ind=round(i2/length(used)*L);
            CMast{ind}=[CMast{ind} Mast(used(i2))];
            CSlave{ind}=[CSlave{ind} Slave(used(i2))];
        end
    end
end
for i=1:L
    MastAV(i)=mean(CMast{i});
    SlaveAV(i)=mean(CSlave{i});
%     MastAV(i)=sum(CMast{i})/length(CMast{1});
%     SlaveAV(i)=sum(CSlave{i})/length(CSlave{1});
t(i)=i/L;
end
plot(t,MastAV/max(MastAV),'g')
hold on
plot(t,SlaveAV/max(SlaveAV),'r')
legend('AP2','CLCa')
xlabel('Fraction of Trace')