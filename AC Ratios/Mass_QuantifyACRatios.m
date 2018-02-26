%folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
folder='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed\Good';
%folder='E:\CME Superfolder\CME Data\180208_AP2CLCa_Data\Traces\Good';
reg='*singlestack*ZGauss*';
files=FindFiles(folder,reg).';
Firsts=[];
Fr='Stack1';
for i=1:length(files)
    if ~isempty(regexp(files{i},Fr))
        Firsts=[Firsts i];
    end
end

Mc=cell(1,9);
Sc=cell(1,9);
MSrc=cell(1,9);
Mo=cell(1,9);
So=cell(1,9);
MSro=cell(1,9);
Mc=cell(1,9);
Sc=cell(1,9);
MSrc=cell(1,9);
Mo=cell(1,9);
So=cell(1,9);
MSro=cell(1,9);
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
        %[Mc,Sc,MSrc,MACc,SACc,Samplec]=QuantifyACRatios_Full_VeryGoodFits_Add(Sfiles,Mc,Sc,MSrc);
        [Mc,Sc,MSrc,MACc,SACc,Samplec]=QuantifyACRatios_Add_Options(Sfiles,Mc,Sc,MSrc,"Reasonable",1);
    else
        %[Mo,So,MSro,MACo,SACo,Sampleo]=QuantifyACRatios_Full_VeryGoodFits_Add(Sfiles,Mo,So,MSro);
        [Mo,So,MSro,MACo,SACo,Sampleo]=QuantifyACRatios_Add_Options(Sfiles,Mo,So,MSro,"Reasonable",1);
    end
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