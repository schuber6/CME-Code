function [FWHMs,XCR,shift_x,shift_y]=CorrelationAnalysis_Mats(IMG1,IMG2)

%folder='E:\CME Superfolder\CME Data\TIRF SIM\488 Beads 170nm';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';
nbins=50;
IMG{1}=IMG1;
IMG{2}=IMG2;
Inds=[1 2];
[shift_x,shift_y,DM,SIM{1},SIM{2}]=AlignAndMaxXCorr(IMG{1},IMG{2},1);
XCR=DM;
for i=1:length(Inds)
    IM=SIM{i};
    [~,SmallAC]=Autocorrellation(IM,20);
    
    [xs,ys]=RadialDistancePlot(SmallAC,nbins);
    ys=ys/max(ys); %(ys-min(ys))/(max(ys)-min(ys));
    xq=0:max(xs);
    yi=interp1(xs,ys,xq);
    [xL,xR]=FindFWHMBoundaries(yi,0);
    FWHMs(i)=xR*80;
    FWHMx{i}=strcat('FWHM = ',num2str((xR)*80),' nm');
    
    [xL,xR]=FindFWHMBoundaries(max(SmallAC,[],2)/max(max(SmallAC)),0);
    FWHMy{i}=strcat('FWHM = ',num2str((xR-xL)*40),' nm');
   
end
