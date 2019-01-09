folder='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo\170520_Analysis\movies';
reg='*Linked*';
files=FindFiles(folder,reg).';
Firsts=[];
Fr='Stack1';
for i=1:length(files)
    if ~isempty(regexp(files{i},Fr))
        Firsts=[Firsts i];
    end
end
for i=1:3
    clear Sfiles
    ind=1;
    for i2=1:length(files)
        if ~isempty(regexp(files{i2},strcat('00',num2str(i))))
            Sfiles{ind}=files{i2};
            ind=ind+1;
        end
    end
    [MAC{i},SAC{i}]=QuantifyACRatios(Sfiles);
end
save(strcat(folder,'\Mass_ACRatios.mat'),'MAC','SAC')