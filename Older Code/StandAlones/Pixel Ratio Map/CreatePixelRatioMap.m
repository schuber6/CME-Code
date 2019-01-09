clear all
folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 4';
files=FindFiles(folder,'*.tif');
FileCA=files{1};
FileCL=files{2};
newfile='Z:\Scott\TIRF SIM\Control CALM Clathrin 4\RatioMap_AP.tif';
thresh=150;

F=length(imfinfo(FileCA));
IMCA=imread(FileCA,'Index',1);
IMCL=imread(FileCL,'Index',1);
[RMca,MiCA,MaCA]=ConvertTo16Bit(IMCA);
[RMcl,MiCL,MaCL]=ConvertTo16Bit(IMCL);
[shift_x,shift_y,~,~,~]=AlignAndMaxXCorr(IMCA,IMCL,0);
[IMCA,IMCL]=OverlapImages(IMCA,IMCL,shift_x,shift_y);
RM=MaskedRatioMap(IMCA,IMCL,thresh);
[RM,MiRM,MaRM]=ConvertTo16Bit(RM);
for i=1:F
    IMCA=imread(FileCA,'Index',i);
    IMCL=imread(FileCL,'Index',i);
    [IMCA,IMCL]=OverlapImages(IMCA,IMCL,shift_x,shift_y);
    RM=MaskedRatioMap(IMCA,IMCL,thresh);
    RM=ConvertTo16Bit(RM,MiRM,MaRM);
    [a,b]=size(IMCA);
    RMca=ConvertTo16Bit(IMCA,MiCA,MaCA);
    RMcl=ConvertTo16Bit(IMCL,MiCL,MaCL);
    RM(:,:,1)=RM;
%     RM(:,:,1)=RMcl;
%     RM(:,:,2)=RMca;
    RM(:,:,3)=zeros(a,b);
    imwrite(RM,newfile,'Writemode','append','Compression','none');
end

