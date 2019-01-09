%clear all
load('BothDSIO_Struct_180831.mat')
FrameGap=2;

ClathMin=.6*10^4;

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

Groups={SIpre,WTpre,SI3m66,WT3m66,SI3m80,WT3m80,SI10m66,WT10m66,SI10m80,WT10m80};

h=waitbar(0,'MS Ratios');

for i0=1:length(Groups)
    waitbar(i0/length(Groups))
    for i00=1:length(Groups{i0})
        load(DSIOfiles(Groups{i0}(i00)).file)
        FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap);
        [FXYCMS_S,Value,Slopes]=SelectStallsByJoshSlopes(FXYCMS);
        [Nc,Fs,FXYCMS_P]=CountConclusions_BySlope(FXYCMS,1000,10,FrameGap,60);
        MaxSca=[];
        MaxScl=[];
        MaxPca=[];
        MaxPcl=[];
        for i=1:length(FXYCMS_S)
            fxyc=FXYCMS_S{i};
            MaxSca=[MaxSca max(fxyc(:,7))];
            MaxScl=[MaxScl max(fxyc(:,6))];
        end
        for i=1:length(FXYCMS_P)
            fxyc=FXYCMS_P{i};
            MaxPca=[MaxPca max(fxyc(:,7))];
            MaxPcl=[MaxPcl max(fxyc(:,6))];
        end
        SPca{i0}(i00)=median(MaxSca)/median(MaxPca);
        SPr{i0}(i00)=median(MaxSca./MaxScl)/median(MaxPca./MaxPcl);
    end
end
close(h)

%%

bins=20;
[HPca,xbinsca]=hist(MaxPca,bins);
[HSca]=hist(MaxSca,xbinsca);
[HPr,xbinsr]=hist(MaxPca./MaxPcl,bins);
[HSr]=hist(MaxSca./MaxScl,xbinsr);
subplot(1,2,1)
plot(xbinsca,HSca/sum(HSca),'r')
hold on
plot(xbinsca,HPca/sum(HPca),'g')
subplot(1,2,2)
plot(xbinsr,HSr/sum(HSr),'r')
hold on
plot(xbinsr,HPr/sum(HPr),'g')

%%
ylab1='Stalled CALM/Pit CALM';
ylab2='Stalled AC ratio/Pit AC ratio';
YL1=[1 2.5];
YL2=[0 2];
L={'Control','CALM siRNA'};

for i=1:length(SPca)/2
    Dca{i}={SPca{2*i-1},SPca{2*i}};
    Dr{i}={SPr{2*i-1},SPr{2*i}};
end

FN=[1 2 5 3 6];
figure
for i=1:length(SPca)/2
subplot(2,3,FN(i))
BoxPlotCell(Dca{i},@notBoxPlot)
ylabel(ylab1)
xticklabels(L)
ylim(YL1)
end

figure
for i=1:length(SPca)/2
subplot(2,3,FN(i))
BoxPlotCell(Dr{i},@notBoxPlot)
ylabel(ylab2)
xticklabels(L)
ylim(YL2)
end