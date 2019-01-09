clear all
folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
filesM=FindFiles(folder,'170409*009*.tif').';


for i=1:length(filesM)/2
    F=length(imfinfo(filesM{2*i}));
    newmovie=strcat(filesM{2*i-1}(1:end-4),'_OffsetMS.tif');
    for i2=1:F
        clear B C
        IMg=imread(filesM{2*i-1},'Index',i2);
        IMr=imread(filesM{2*i},'Index',i2);
        [A,B]=size(IMr);
        IMr=[zeros(A,6) IMr];
        IMg=[IMg zeros(A,6)];
        [A,B]=size(IMr);
        
        C(:,:,1)=IMr(:,:);
        C(:,:,2)=IMg(:,:);
        C(:,:,3)=zeros(A,B);
        imwrite(C,newmovie,'Writemode','append','Compression','none')
    end
end