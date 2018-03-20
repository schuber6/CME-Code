folder='E:\CME Superfolder\CME Data\180316_TwoColorBeadBleach';
files=FindFiles(folder,'*001.tif');
newfile=strcat(files{1}(1:end-4),'_TrimmedGreen.tif');
frames=401:10:1601;
for i=frames
    A=imread(files{1},'Index',i);
    imwrite(A,newfile,'Writemode','append','Compression','none')
end