exp_name='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces';
Fixed_Fold='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed\';
reg='*.mat';
[files,names]=FindFiles_Full(exp_name,reg);
h=waitbar(0,'rename');
for i=1:length(files)
    waitbar(i/200)
    if i<=190
        map=i+10;
    else
        map=i-190;
    end
    load(files{i})
    newfile=strcat(Fixed_Fold,names{map});
    save(newfile,'NSTA');
end
close(h)