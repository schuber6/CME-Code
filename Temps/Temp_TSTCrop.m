clear all

folder='E:\CME Superfolder\CME Data\TIRF SIM\Control AP2 Clathrin';
fileG=FindFiles(folder,'*488*cam*');
fileR=FindFiles(folder,'*560*cam*');
fileS=strcat(folder,'\TST.mat');
fileGPL=strcat(folder,'\Plaques488.mat');
fileRPL=strcat(folder,'\Plaques560.mat');

load(fileS)

i=3;
frames=tracest(i).frame;
xs=round(tracest(i).xpos);
ys=round(tracest(i).ypos);
r=tracest(i).zrad;
%figure
for i2=1:length(frames)
    RIM=imread(fileR{1},'Index',frames(i2));
    GIM=imread(fileG{1},'Index',frames(i2));
    RCrop{i,i2}=CropEvent(xs(i2),ys(i2),RIM,r);
    GCrop{i,i2}=CropEvent(xs(i2)+3,ys(i2)-5,GIM,r);
%     subplot(2,7,i2)
%     imagesc(RCrop)
%     subplot(2,7,i2+7)
%     imagesc(GCrop)
    save(fileGPL,'GCrop')
    save(fileRPL,'RCrop')
end