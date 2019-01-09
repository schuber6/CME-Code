folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
reg='*LinkedMS*';
files=FindFiles(folder,reg).';
Firsts=[];
Fr='Stack1';
for i=1:length(files)
    if ~isempty(regexp(files{i},Fr))
        Firsts=[Firsts i];
    end
end
Data=[];
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
    HistACRatios(Sfiles)
    %[NSD,SD]=QuantifyCInts(Sfiles);
    %Data=[Data ; SD];
end

% figure
% boxplot(Data(:,1),Data(:,2))
% FU=find(Data(:,2)==1);
% LU=find(Data(:,2)==5);
% PB=median(Data(FU,1))/median(Data(LU,1));
% II=median(Data(FU,1));
%save(strcat(folder,'\Mass_ACRatios.mat'),'MAC','SAC')