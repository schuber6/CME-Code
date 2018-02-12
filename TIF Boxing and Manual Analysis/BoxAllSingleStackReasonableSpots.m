folder='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed';
reg='*singlestack*ZGauss*';
files=FindFiles(folder,reg).';
moviefold='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Full\Isolated Cells\FocalPlane';
reg='*.tif';
moviefiles=FindFiles(moviefold,reg).';
for i=1:length(moviefiles)
    events=[];
    for i2=1:5
        load(files{(i-1)*5+i2})
        usedC=SelectReasonableZGaussFits(NSTAms);
        used=MakeVectorOfGood(usedC);
        for i3=1:length(used)
            X=NSTAms(used(i3)).xpos(1);
            Y=NSTAms(used(i3)).ypos(1);
            events=[events ; [i2 X Y]];
        end
    end
    newfile=strcat(moviefiles{i}(1:end-4);
    BoxEvents(moviefiles{i},newfile,events)
end