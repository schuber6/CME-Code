%Code used to find appropriate lines to use for kymographs

%Load images
clear all
files{1}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont\Movies\wt_cont_038_BS_';
i0=1;

file=strcat(files{i0},'Green.tif'); %'E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Movies\si_cont_006_BS_Green.tif';
IM=[];
for i=1:length(imfinfo(file))
    IM(:,:,2,i)=imread(file,'Index',i);
end

file=strcat(files{i0},'Red.tif'); %'E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Movies\si_cont_006_BS_Red.tif';
%IM=[];
for i=1:length(imfinfo(file))
    IM(:,:,1,i)=imread(file,'Index',i);
end
%%  Request user input to find ends of kymograph lines
figure
imagesc(IM(:,:,1))
[y,x,p] = impixel; 
xi=x(1:2);
yi=y(1:2);
%%  Display Kymograph to check that it looks good
i0=2;
offset=4;
Kr=Kymograph(IM(:,:,1,:),xi,yi);
Kg=Kymograph(IM(:,:,2,:),xi,yi+offset);
K=zeros([size(Kr) 3]);
figure
K(:,:,1)=Kr/max(max(Kr))*255;
K(:,:,2)=Kg/max(max(Kg))*255;
K8=uint8(K);
imshow(K8)