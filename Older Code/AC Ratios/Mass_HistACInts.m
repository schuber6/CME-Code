%folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
folder='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed';
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
    HistACInts_MultiStacks(Sfiles);
end


