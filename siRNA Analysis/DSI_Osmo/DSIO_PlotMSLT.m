clear
load('BothDSIO_Struct_180920_EndoFilter.mat')

ClathMin=.5*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

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

used{1}=SIpre;
used{2}=WTpre;
used{3}=SI3m66;
used{4}=WT3m66;
used{5}=SI3m80;
used{6}=WT3m80;
used{7}=SI10m66;
used{8}=WT10m66;
used{9}=SI10m80;
used{10}=WT10m80;

names{1}='siRNA Before';
names{2}='WT Before';
names{3}='siRNA 3 min after 66%';
names{4}='WT 3 min after 66%';
names{5}='siRNA 3 min after 80%';
names{6}='WT 3 min after 80%';
names{7}='siRNA 10 min after 66%';
names{8}='WT 10 min after 66%';
names{9}='siRNA 10 min after 80%';
names{10}='WT 10 min after 80%';

figure
for i=1:length(used)
    subplot(2,5,i)
    MSLT=[];
    for i2=1:length(used{i})
        MSLT=[MSLT ; MSLT_EF{used{i}(i2)}];
    end
    scatter(MSLT(:,2)*2,MSLT(:,1))
    xlabel('Lifetime (s)')
    ylabel('Peak CALM Intensity')
    xlim([0 200])
    title(names{i})
end