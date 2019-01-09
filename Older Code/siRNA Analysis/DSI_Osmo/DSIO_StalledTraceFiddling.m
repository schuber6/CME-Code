%%
clear
load('BothDSIO_Struct_180920_EndoFilter_30s.mat')
MaxLTF=Inf;
FrameGap=2;
MinLTF=5;
Tmast=0;
ClathMin=.5*10^4; 

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

Gs={WT10m66,SI10m80,WT10m80,SI3m80};

for Group=1:length(Gs)
    
    for i=1:length(Gs{Group})
        Ind=Gs{Group}(i);
        FXYC{Ind}=FindStalledTraces(DSIOfiles(Ind).file);
    end
end

%%

Group=1;
ind=1;
for i=1:length(Gs{Group})
    M=Gs{Group}(i);
    fxycC=FXYC{M};
    for i2=1:20 %length(fxycC)
        fxyc=fxycC{i2};
        fxycG{ind}=fxyc;
        SuperSubplot(ind)
        plot(fxyc(:,6),'r')
        hold on
        plot(fxyc(:,7),'g')
        CALM(ind)=max(fxyc(:,7))/10^4;
        title(num2str(max(fxyc(:,7))/10^4))
        cropR{ind}=PitAtMax(fxyc,DSIOfiles(M).movieR);
        cropG{ind}=PitAtMax(fxyc,DSIOfiles(M).movieG);
        ind=ind+1;
    end
end