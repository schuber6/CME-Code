folder='E:\CME Superfolder\CME Data\180208_AP2CLCa_Data\Full';
reg='*2d*BS*';
files=FindFiles(folder,reg);
for i=1:length(files)
    oddnew=strcat(files{i}(1:end-4),'_CLCa.tif');
    evennew=strcat(files{i}(1:end-4),'_AP2.tif');
    SplitChannels(files{i},oddnew,evennew)
end