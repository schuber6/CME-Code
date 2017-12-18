function PlotLifetimeDistributionsTH(Thresh,fxyc,FrameGap)

TB=[];
TA=[];
for i=1:length(fxyc(1,1,:))
    if fxyc(1,4,i)==3
        if max(fxyc(:,5,i))>Thresh
            TA=[TA length(find(fxyc(:,1,i)))*FrameGap];
        else
            TB=[TB length(find(fxyc(:,1,i)))*FrameGap];
        end
    end
end
xbins=1:300;
xbins=xbins*3;
HA=hist(TA,xbins);
HB=hist(TB,xbins);
plot(xbins,HA,'r')
hold on
plot(xbins,HB,'b')
xlim([0 300])