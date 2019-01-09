function comb_run_masterslave(folder,fg,thresh)


%%  Organize Files

RedFiles=FindFiles(folder,'*Red*.tif');
GreenFiles=FindFiles(folder,'*Green*.tif');
Mfol=strcat(folder,'\Movies');
mkdir(Mfol);
Tfol=strcat(folder,'\orig_movies');
Sfol=strcat(folder,'\split_movies');
mkdir(Tfol);
for i=1:length(RedFiles)
    copyfile(RedFiles{i},Tfol);
end
for i=1:length(RedFiles)
    movefile(RedFiles{i},Mfol);
end
for i=1:length(GreenFiles)
    movefile(GreenFiles{i},Mfol);
end

%% Run Tracking on Red Channel

comb_run(folder,fg,thresh)

%% ReOrganize Files

Trfol=strcat(folder,'\Traces');
tfiles=FindFiles(Tfol,'*.mat');
mkdir(Trfol)
for i=1:length(tfiles)
    movefile(tfiles{i},Trfol);
end
% files=FindFiles(Tfol,'*');
% for i=3:length(files)
%     delete(files{i});
% end
rmdir(Tfol,'s');
% files=FindFiles(Sfol,'*');
% for i=3:length(files)
%     delete(files{i});
% end
rmdir(Sfol,'s');


%% Run Master Slave Intensity calculation

MasterSlave_RedMaster(Trfol,Mfol);

%% ReReOrganize Files

files=FindFiles(Trfol,'*');
for i=3:length(files)
    delete(files{i});
end
MSfiles=FindFiles(Mfol,'*FXYCMS*');
for i=1:length(MSfiles)
    movefile(MSfiles{i},Trfol);
end