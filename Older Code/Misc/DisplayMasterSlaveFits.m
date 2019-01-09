movieM ='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_pre_004GFP_BS.tif';
movieS ='E:\CME Superfolder\CME Data\170518_Analysis\170519_pre_004RFP_BS.tif';
CropSize=5;
HalfCrop=(CropSize-1)/2;

i=ceil(rand*length(fxyc_struct));
used=find(fxyc_struct(i).xpos);
UI=ceil(rand*length(used));
Xi=round(fxyc_struct(i).xpos(UI));
Yi=round(fxyc_struct(i).ypos(UI));

subplot(2,2,4)
scatter(fxyc_struct(i).xpos(UI),fxyc_struct(i).ypos(UI),'b')
hold on
scatter(fxyc_struct(i).Sx(UI),fxyc_struct(i).Sy(UI),'r')
scatter(fxyc_struct(i).Sx5(UI),fxyc_struct(i).Sy5(UI),'g')
xlim([Xi-CropSize/2 Xi+CropSize/2])
ylim([Yi-CropSize/2 Yi+CropSize/2])
text(double(Xi-CropSize/2),double(Yi+CropSize/2+1),strcat('SDx=',num2str(fxyc_struct(i).Ssdx(UI)),',',num2str(fxyc_struct(i).Ssdx5(UI))))
text(double(Xi-CropSize/2),double(Yi+CropSize/2+.5),strcat('SDy=',num2str(fxyc_struct(i).Ssdy(UI)),',',num2str(fxyc_struct(i).Ssdy5(UI))))
text(double(Xi+CropSize/2),double(Yi+CropSize/2+.5),strcat('Dist=',num2str(norm([fxyc_struct(i).Sx(UI)-fxyc_struct(i).Mx(UI) fxyc_struct(i).Sy(UI)-fxyc_struct(i).My(UI)]))))
scatter(fxyc_struct(i).Mx(UI),fxyc_struct(i).My(UI),'k')
scatter(fxyc_struct(i).Mx5(UI),fxyc_struct(i).My5(UI),'c')

subplot(2,2,3)
scatter(fxyc_struct(i).xpos(UI),fxyc_struct(i).ypos(UI),'b')
hold on
scatter(fxyc_struct(i).Mx(UI),fxyc_struct(i).My(UI),'k')
scatter(fxyc_struct(i).Mx5(UI),fxyc_struct(i).My5(UI),'c')
xlim([Xi-CropSize/2 Xi+CropSize/2])
ylim([Yi-CropSize/2 Yi+CropSize/2])
text(double(Xi-CropSize/2),double(Yi+CropSize/2+1),strcat('SDx=',num2str(fxyc_struct(i).Msdx(UI)),',',num2str(fxyc_struct(i).Msdx5(UI))))
text(double(Xi-CropSize/2),double(Yi+CropSize/2+.5),strcat('SDy=',num2str(fxyc_struct(i).Msdy(UI)),',',num2str(fxyc_struct(i).Msdy5(UI))))
text(double(Xi+CropSize/2),double(Yi+CropSize/2+.5),strcat('(f,x,y)=(',num2str(fxyc_struct(i).frame(UI)),',',num2str(fxyc_struct(i).xpos(UI)),',',num2str(fxyc_struct(i).ypos(UI)),')'))

frame=fxyc_struct(i).frame(UI);
MM=imread(movieM,'Index',frame);
MS=imread(movieS,'Index',frame);


CropS=zeros(CropSize);
CropM=zeros(CropSize);
for ix=-1*HalfCrop:HalfCrop
    for iy=-1*HalfCrop:HalfCrop
        CropM(iy+HalfCrop+1,ix+HalfCrop+1)=MM(Yi+iy,Xi+ix);
        CropS(iy+HalfCrop+1,ix+HalfCrop+1)=MS(Yi+iy,Xi+ix);
    end
end
subplot(2,2,1)
imagesc(CropM)
hold on
text(0,0,strcat('Amp=',num2str(fxyc_struct(i).int(UI)),',',num2str(fxyc_struct(i).Mint(UI)),',',num2str(fxyc_struct(i).Mint5(UI)),',',num2str(fxyc_struct(i).MSum5(UI))))
subplot(2,2,2)
imagesc(CropS)
hold on
text(0,0,strcat('Amp=',num2str(fxyc_struct(i).Sint(UI)),',',num2str(fxyc_struct(i).Sint5(UI)),',',num2str(fxyc_struct(i).SSum5(UI))))
%ylim([276 284])
% for i=1:length(fxyc_struct)
% end