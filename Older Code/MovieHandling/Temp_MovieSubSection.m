folder='E:\CME Superfolder\CME Data\180323_NileRed_2ColorBeadBleaching';
files=FindFiles(folder,'*continuous.tif');
newfile=strcat(files{1}(1:end-4),'_100s_Green.tif');
frames=2:100:5176;
for i=frames
    A=imread(files{1},'Index',i);
    imwrite(A,newfile,'Writemode','append','Compression','none')
end