%folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
title1='AP2 Intensity';
%folder='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed\Good';
folder='E:\CME Superfolder\CME Data\180208_AP2CLCa_Data\Traces\Good';
reg='*singlestack*ZGauss*';
files=FindFiles(folder,reg).';
Firsts=[];
Fr='Stack1';
for i=1:length(files)
    if ~isempty(regexp(files{i},Fr))
        Firsts=[Firsts i];
    end
end
for i=1:length(Firsts)
    clear Sfiles
    if i~=length(Firsts)
        for i2=Firsts(i):(Firsts(i+1)-1)
            Sfiles{i2-Firsts(i)+1}=files{i2};
        end
    else
        for i2=Firsts(i):length(files)
            Sfiles{i2-Firsts(i)+1}=files{i2};
        end
    end
    if i<=3
        color=[0 1 0];
    else
        color=[1 0 0];
    end
    PlotACVsZ_MultiStacks(Sfiles,1,color,title1);
end


