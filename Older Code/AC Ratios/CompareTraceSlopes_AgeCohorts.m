CohortEdges=[0 6 24 60];
for i=1:MaxFrameFXYCMS(FXYCMS)
    Traces=FindAgeCohortTraces(FXYCMS,CohortEdges,i);
    for i2=1:length(CohortEdges)
        [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,Traces{i2},i);
        if ~isempty(MI)
            [slope(i,i2), rsq(i,i2)]=LinearSlopeandR2_0Intercept(SI,MI);
            N(i,i2)=length(MI);
        else
            slope(i,i2)=0;
            rsq(i,i2)=0;
            N(i,i2)=0;
        end
    end
end
Nbins=length(CohortEdges);
FSFig
for i=1:Nbins
    Frac=(i-1)/(Nbins-1);
    C=[Frac 1-Frac 0];
    used=find(slope(:,i));
%     subplot(1,2,1)
    plot(used,slope(used,i),'Color',C)
    hold on
%     subplot(1,2,2)
%     plot(used,N(used,i),'Color',C)
%     hold on
legend('New Traces','30-120s Traces','120-300s Traces','300+s Traces')
end