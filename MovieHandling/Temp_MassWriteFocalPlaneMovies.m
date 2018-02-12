moviefold='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Full\Isolated Cells\Split Channels';
reg='*singlestack*CLCa.tif';
moviefiles=FindFiles(moviefold,reg).';
for i=1:length(moviefiles)
    WriteFocalPlaneMovie(moviefiles{i});
end