clear all
load('DSIO_StallIntensities_181203.mat')
%load('BothDSIO_Struct_180920_EndoFilter_30s.mat')
load('BothDSIO_Struct_180914_LTs.mat')
LT_EF=LT;

ClathMin=1*10^4;
SIpre=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.Day]<3 & [DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

% SIpre=SIpre(1);
% WTpre=WTpre(1);
% SI10m66=SI10m66(1);
% WT10m66=WT10m66(1);
% SI10m80=SI10m80(1);
% WT10m80=WT10m80(1);

LTG(2,:)=LifetimeGroups([DSIOfiles(SIpre).area],LT_EF,StallM,SIpre);
LTG(1,:)=LifetimeGroups([DSIOfiles(WTpre).area],LT_EF,StallM,WTpre);

LTG(4,:)=LifetimeGroups([DSIOfiles(SI10m66).area],LT_EF,StallM,SI10m66);
LTG(3,:)=LifetimeGroups([DSIOfiles(WT10m66).area],LT_EF,StallM,WT10m66);

LTG(6,:)=LifetimeGroups([DSIOfiles(SI10m80).area],LT_EF,StallM,SI10m80);
LTG(5,:)=LifetimeGroups([DSIOfiles(WT10m80).area],LT_EF,StallM,WT10m80);

Xs=[1 2 3.5 4.5 6 7];
figure
Obj=bar(Xs,LTG,'Stacked');
xticks(Xs)
xticklabels({'Control','siRNA','Control','siRNA','Control','siRNA'})
ylabel('Traces/um^2')
legend(fliplr(Obj),{'150+s Pits','24-150s Pits','10-24s Pits'})
