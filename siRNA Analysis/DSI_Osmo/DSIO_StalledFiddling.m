sig=0;
YL=[0 4*10^4];
ClathMin=.5*10^4;
ylab='Median CALM content of stalled CCSs';

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

% PreC={[DSIOfiles(WTpre).NStallPerArea],[DSIOfiles(SIpre).NStallPerArea]};
% P3m66C={[DSIOfiles(WT3m66).NStallPerArea],[DSIOfiles(SI3m66).NStallPerArea]};
% P10m66C={[DSIOfiles(WT10m66).NStallPerArea],[DSIOfiles(SI10m66).NStallPerArea]};
% P3m80C={[DSIOfiles(WT3m80).NStallPerArea],[DSIOfiles(SI3m80).NStallPerArea]};
% P10m80C={[DSIOfiles(WT10m80).NStallPerArea],[DSIOfiles(SI10m80).NStallPerArea]};

PreC={[DSIOfiles(WTpre).StallCALMMedian],[DSIOfiles(SIpre).StallCALMMedian]};
P3m66C={[DSIOfiles(WT3m66).StallCALMMedian],[DSIOfiles(SI3m66).StallCALMMedian]};
P10m66C={[DSIOfiles(WT10m66).StallCALMMedian],[DSIOfiles(SI10m66).StallCALMMedian]};
P3m80C={[DSIOfiles(WT3m80).StallCALMMedian],[DSIOfiles(SI3m80).StallCALMMedian]};
P10m80C={[DSIOfiles(WT10m80).StallCALMMedian],[DSIOfiles(SI10m80).StallCALMMedian]};

figure
subplot(2,3,1)
BoxPlotCell(PreC,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(1)]=kstest2(PreC{1},PreC{2});
    if p(1)>.05
       % p(1)=nan;
    end
    sigstar([1 2],p(1))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(2)]=kstest2(P3m66C{1},P3m66C{2});
    if p(2)>.05
       % p(2)=nan; 
    end
    sigstar([1 2],p(2))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(3)]=kstest2(P10m66C{1},P10m66C{2});
    if p(3)>.05
      %  p(3)=nan;
    end
    sigstar([1 2],p(3))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(4)]=kstest2(P3m80C{1},P3m80C{2});
    if p(4)>.05
       % p(4)=nan;
    end
    sigstar([1 2],p(4))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(5)]=kstest2(P10m80C{1},P10m80C{2});
    if p(5)>.05
       % p(5)=nan;
    end
    sigstar([1 2],p(5))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)