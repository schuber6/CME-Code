%moviefold='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Full\Isolated Cells\Split Channels';
moviefold='E:\CME Superfolder\CME Data\180208_AP2CLCa_Data\Full\Isolated Cells\Split Channels';
reg='*singlestack*AP2.tif';
moviefiles=FindFiles(moviefold,reg).';
for i=1:length(moviefiles)
    WriteFocalPlaneMovie(moviefiles{i});
end