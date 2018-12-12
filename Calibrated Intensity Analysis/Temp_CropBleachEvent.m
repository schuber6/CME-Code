clear all
load('E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\tracest.mat')
movie='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\calibration_002_BS.tif';
New='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\calibration_002_crop3.tif';
r=100;
for i=1:length(tracest(1).frame)
    x=round(tracest(1).xpos(i));
    y=round(tracest(1).ypos(i));
    f=tracest(1).frame(i);
    IM=imread(movie,'Index',f);
    crop=uint16(CropEvent(x,y,IM,r));
    imwrite(crop,New,'Writemode','append','Compression','none')
end
for i=1:5
    IM=imread(movie,'Index',f+i);
    crop=uint16(CropEvent(x,y,IM,r));
    imwrite(crop,New,'Writemode','append','Compression','none')
end