
folder='E:\CME Superfolder\CME Data\170907_CALM_CLCa_1StackOsmo';
reg='*Linked*';
files=FindFiles(folder,reg).';
Firsts=[];
Fr='Stack0{0,1}1L';
for i=1:length(files)
    if ~isempty(regexp(files{i},Fr))
        Firsts=[Firsts i];
    end
end
Data=[];
for i=1:length(Firsts)
    clear Sfiles
    ind=1;
    if i==length(Firsts)
        EI=length(files);
    else
        EI=Firsts(i+1)-1;
    end
    for i2=Firsts(i):EI
        
            Sfiles{ind}=files{i2};
            ind=ind+1;
        
    end
    [NSD,SD]=QuantifyCInts(Sfiles);
    Data=[Data ; SD];
end
figure
boxplot(Data(:,1),Data(:,2))
FU=find(Data(:,2)==1);
LU=find(Data(:,2)==5);
PB=median(Data(FU,1))/median(Data(LU,1));
II=median(Data(FU,1));
%save(strcat(folder,'\Mass_ACRatios.mat'),'MAC','SAC')