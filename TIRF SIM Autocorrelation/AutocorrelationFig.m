function AutocorrelationFig(IM)
%folder='E:\CME Superfolder\CME Data\TIRF SIM\488 Beads 170nm';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';

Inds=1;
nbins=50;
i=1;
WidthCut=exp(-1/2);
Col='g';

figure
subplot(2,2,1)
imagesc(IM)
colorbar
subplot(2,2,2)
[xs,ys]=RadialDistancePlot(IM,nbins);
ys=ys/max(ys); %(ys-min(ys))/(max(ys)-min(ys));
plot(xs,ys,Col)
hold on
xq=0:max(xs);
yi=interp1(xs,ys,xq);
[xL,xR]=FindFWeMBoundaries(yi,0,WidthCut);
FWHMx{i}=strcat('SD = ',num2str((xR-1)));

line([0 xR-1],[WidthCut+(i-1)*.01 WidthCut+(i-1)*.01],'Color',Col,'LineStyle','--')
title(strcat('Radial Average of Image. ',FWHMx))
[AC,SmallAC]=Autocorrellation(IM,50);
subplot(2,2,3)
imagesc(SmallAC)
colorbar
title('Autocorrelatoin Image')
subplot(2,2,4)
[xs,ys]=RadialDistancePlot(SmallAC,nbins);
ys=ys/max(ys); %(ys-min(ys))/(max(ys)-min(ys));
plot(xs,ys,Col)
%plot(max(SmallAC,[],1)/max(max(SmallAC)),Col)
hold on
xq=0:max(xs);
yi=interp1(xs,ys,xq);
[xL,xR]=FindFWeMBoundaries(yi,0,WidthCut);
FWHMx{i}=strcat('SD = ',num2str((xR-1)));
    
    line([0 xR-1],[WidthCut+(i-1)*.01 WidthCut+(i-1)*.01],'Color',Col,'LineStyle','--')
    
    xlabel('Pixels')
    title(strcat('Radial Average of Autocorrelation. ',FWHMx))



