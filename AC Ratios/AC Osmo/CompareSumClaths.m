CohortEdges=[0 6 24 60];
for i=1:MaxFrameFXYCMS(FXYCMS)
    Traces=FindAgeCohortTraces(FXYCMS,CohortEdges,i);
    for i2=1:length(CohortEdges)
        [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,Traces{i2},i);
        if ~isempty(MI)
            [slope(i,i2), rsq(i,i2)]=LinearSlopeandR2_0Intercept(SI,MI);
            N(i,i2)=length(MI);
            Msum(i,i2)=sum(MI);
            Ssum(i,i2)=sum(SI);
        else
            slope(i,i2)=0;
            rsq(i,i2)=0;
            N(i,i2)=0;
            Msum(i,i2)=0;
            Ssum(i,i2)=0;
        end
    end
end

Nbins=length(CohortEdges);
FSFig
for i=1:Nbins
    Frac=(i-1)/(Nbins-1);
    C=[Frac 1-Frac 0];
    used=find(slope(:,i));
     subplot(1,2,1)
    plot(used,Msum(used,i),'Color',C)
    hold on
     subplot(1,2,2)
     plot(used,Ssum(used,i),'Color',C)
     hold on
    legend('New Traces','30-120s Traces','120-300s Traces','300+s Traces')
end
for i=1:length(Msum(:,1))
    Ssumsum(i)=sum(Ssum(i,:));
    Msumsum(i)=sum(Msum(i,:));
end
subplot(1,2,1)
plot(Msumsum,'k')
subplot(1,2,2)
plot(Ssumsum,'k')
figure
plot(Msumsum/mean(Msumsum(2:55)),'g')
hold on
plot(Ssumsum/mean(Ssumsum(2:55)),'r')