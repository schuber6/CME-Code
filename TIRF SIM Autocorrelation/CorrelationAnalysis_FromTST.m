function [FWHMs,XCR,isPlaque,shift_x,shift_y,IntG,IntR]=CorrelationAnalysis_FromTST(tracest,fileR,fileG)

h=waitbar(0,'Correlation');
FWHMs={};
XCR=[];
isPlaque=[];
shift_x=[];
shift_y=[];
IntG=[];
IntR=[];
for i=2:length(tracest)
    waitbar(i/length(tracest))
    frames=tracest(i).frame;
    xs=round(tracest(i).xpos);
    ys=round(tracest(i).ypos);
    r=tracest(i).zrad+1;
    for i2=1:length(frames)
        isPlaque(i,i2)=tracest(i).ispair;
        RIM=imread(fileR{1},'Index',frames(i2));
        GIM=imread(fileG{1},'Index',frames(i2));
        RCrop{i,i2}=CropEvent(xs(i2),ys(i2),RIM,r);
        GCrop{i,i2}=CropEvent(xs(i2)+3,ys(i2)-5,GIM,r);
        [FWHMs{i,i2},XCR(i,i2),shift_x(i,i2),shift_y(i,i2),IntG(i,i2),IntR(i,i2)]=CorrelationAnalysis_Mats(GCrop{i,i2},RCrop{i,i2});
    end
end
close(h)