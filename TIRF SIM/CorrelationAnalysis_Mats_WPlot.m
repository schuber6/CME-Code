function [FWHMs,XCR,shift_x,shift_y]=CorrelationAnalysis_Mats_WPlot(IMG1,IMG2)

%folder='E:\CME Superfolder\CME Data\TIRF SIM\488 Beads 170nm';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';
nbins=50;
IMG{1}=IMG1;
IMG{2}=IMG2;
Inds=[1 2];
FSFig

[shift_x,shift_y,DM,SIM{1},SIM{2}]=AlignAndMaxXCorr(IMG{1},IMG{2},1);
XCR=DM;
for i=1:length(Inds)
    if i==1
        Col='g';
    else
        Col='r';
    end
    IM=SIM{i};
    subplot(length(Inds),3,(i-1)*3+1)
    imagesc(IM)
    colorbar
    title(strcat('Original Image. XCorr R= ',num2str(DM)))
    [~,SmallAC]=Autocorrellation(IM,20);
    subplot(length(Inds),3,(i-1)*3+2)
    imagesc(SmallAC)
    colorbar
    title('Autocorrelatoin Image')
    subplot(length(Inds),3,3)
    [xs,ys]=RadialDistancePlot(SmallAC,nbins);
    ys=ys/max(ys); %(ys-min(ys))/(max(ys)-min(ys));
    plot(xs,ys,Col)
    %plot(max(SmallAC,[],1)/max(max(SmallAC)),Col)
    hold on
    xq=0:max(xs);
    yi=interp1(xs,ys,xq);
    [xL,xR]=FindFWHMBoundaries(yi,0);
    FWHMs(i)=xR*80;
    FWHMx{i}=strcat('FWHM = ',num2str((xR)*80),' nm');
    line([0 xR-1],[.5+(i-1)*.01 .5+(i-1)*.01],'Color',Col,'LineStyle','--')
    
    xlabel('Pixel (40nm spacing)')
    title('Radial Average of Autocorrelation')
    subplot(length(Inds),3,6)
    plot(max(SmallAC,[],2)/max(max(SmallAC)),Col)
    hold on
    [xL,xR]=FindFWHMBoundaries(max(SmallAC,[],2)/max(max(SmallAC)),0);
    FWHMy{i}=strcat('FWHM = ',num2str((xR-xL)*40),' nm');
    line([xL xR],[.5 .5],'Color',Col,'LineStyle','--')
    
    xlabel('Pixel (40nm spacing)')
    title('Y Max Projection of Autocorrelation')
end
subplot(2,3,1)
ylabel('488 Channel')
subplot(2,3,4)
ylabel('560 Channel')
subplot(2,3,3)
legend('488',FWHMx{1},'560',FWHMx{2})
subplot(2,3,6)
legend('488',FWHMy{1},'560',FWHMy{2})