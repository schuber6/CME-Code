folder='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed';
reg='*singlestack*ZGauss*';
files=FindFiles(folder,reg).';
moviefold='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Full\Isolated Cells\FocalPlane';
reg='*.tif';
moviefiles=FindFiles(moviefold,reg).';
cols=distinguishable_colors(13,[0 0 0]);
for i=1:length(moviefiles)
    events=[];
    Cs=[];
    for i2=1:5
        load(files{(i-1)*5+i2})
        [usedC,flags]=SelectReasonableZGaussFits_Flags(NSTAms);
        Names=fieldnames(flags);
        Names=sort(Names);
        for i3=1:length(usedC)
            X=NSTAms(i3).xpos(1);
            Y=NSTAms(i3).ypos(1);
            events=[events ; [i2 X Y]];
            SC=cols(1,:);
            for i4=2:length(Names)
                if ~isempty(getfield(flags(i3),Names{i4}))
                    SC=cols(i4,:);
                    break
                end
            end
            Cs=[Cs ; SC];
        end
    end
    newfile=strcat(moviefiles{i}(1:end-4),'_BoxedFlagColors.tif');
    BoxEventsColors(moviefiles{i},newfile,events,Cs)
end