%Example implementation of the Kymograph function to generate figures
%These figures consist of a 2-color xy image, combined with a 2-color
%kymograph

clear all
%Movie files and specs for the line the kymograph looks at
files{1}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont\Movies\wt_cont_038_BS_';
xi{1}=[160 160];
yi{1}=[76 400];
files{2}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min\Movies\wt_osmo_3m_064_BS_';
xi{2}=[289 289];
yi{2}=[7 508];
files{3}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min\Movies\wt_osmo_10m_036_BS_';
xi{3}=[190 190];
yi{3}=[131 470];
files{4}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Movies\si_cont_006_BS_';
xi{4}=[320 320];
yi{4}=[45 382];
files{5}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 3 min\Movies\si_osmo_3m_090_BS_';
xi{5}=[285 285];
yi{5}=[4 409];
files{6}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 10 min\Movies\si_osmo_10m_092_BS_';
xi{6}=[200 200];
yi{6}=[4 504];

offset=4;  %Offset between channels so that both can be seen separately
for i0=1:6
    file=strcat(files{i0},'Green.tif'); %'E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Movies\si_cont_006_BS_Green.tif';
    IM=[];
    for i=1:length(imfinfo(file))
        IM(:,:,2,i)=imread(file,'Index',i);
    end
    
    file=strcat(files{i0},'Red.tif'); %'E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Movies\si_cont_006_BS_Red.tif';
    for i=1:length(imfinfo(file))
        IM(:,:,1,i)=imread(file,'Index',i);
        IM(:,:,3,i)=zeros(size(IM(:,:,1,i)));
    end
    
    Kr=Kymograph(IM(:,:,1,:),xi{i0},yi{i0});
    Kg=Kymograph(IM(:,:,2,:),xi{i0},yi{i0}+offset);
    K=zeros([size(Kr) 3]);
    K(:,:,1)=Kr;
    K(:,:,2)=Kg;
    
    crop=zeros(size(IM(yi{i0}(1):yi{i0}(2),:,:,1)));
    crop(:,:,1)=IM(yi{i0}(1):yi{i0}(2),:,1,1);
    crop(:,:,2)=IM((yi{i0}(1):yi{i0}(2))+offset,:,2,1);
    crop(:,:,3)=IM((yi{i0}(1):yi{i0}(2)),:,3,1);
    
    if i0==1   %I wanted to normalize all movies by the same amount in the green channel
        N=max(max(Kg));
    end
    
    buffer=zeros(length(crop(:,1,1)),3,3);   %Add 3 pixels of whitespace between xy and kymograph
    buffer(:,:,1)=buffer(:,:,1)+max(max(Kr));
    buffer(:,:,2)=buffer(:,:,2)+N;
    buffer(:,:,3)=buffer(:,:,3)+255;
    
    F=[crop  buffer permute(K,[2 1 3])];
    

    figure
    F(:,:,1)=F(:,:,1)/max(max(Kr))*255;  %Normalize all channels to a max of 255 for 8-bit image
    F(:,:,2)=F(:,:,2)/N*255;
    F8=uint8(F);
    imshow(F8)
    hold on
    line(xi{i0},[yi{i0}(1) yi{i0}(1)+2]-min(yi{i0}),'Color','w')
    %line(xi{i0},yi{i0}-min(yi{i0}),'Color','w')   %Draw line where the
    %kymograph is drawn
    line([-31.25 0]+502, [10 10],'Color','w','LineWidth',5)  %Scale bar=5 microns
end


