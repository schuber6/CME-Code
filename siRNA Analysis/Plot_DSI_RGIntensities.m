clear all
folder{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\ZStacks';
folder{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\ZStacks';
folder{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\ZStacks';
folder{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI 3\ZStacks';
folder{5}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI 4\ZStacks';
folder{6}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI 5\ZStacks';

Tmast=3000;
MinLTF=10;

for i=1:6
    moviefolder=strcat(folder{i}(1:end-7),'Movies');
    files{i}=FindFiles(moviefolder,'*Red_FXYCMS*');
    Af=strcat(folder{i},'\Areas_RG.mat');
    load(Af)
    for i0=1:length(files{i})
        load(files{i}{i0});
        [N{i}(i0),Ms{i}{i0},Ss{i}{i0},MMs{i}{i0},MSs{i}{i0}]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF);
        if ~isempty(strfind(files{i}{i0},'wt'))
            G(i,i0)=1;
        else
            G(i,i0)=2;
        end
    end
end
MedM=[];
MedS=[];
MedMM=[];
MedMS=[];
Gs=[];
for i=1:length(Ms)
    for i2=1:length(Ms{i})
        MedM=[MedM median(Ms{i}{i2})];
        MedS=[MedS median(Ss{i}{i2})];
        MedMM=[MedMM median(MMs{i}{i2})];
        MedMS=[MedMS median(MSs{i}{i2})];
        Gs=[Gs G(i,i2)];
    end
end

%%
used1=find(Gs==1);
used2=find(Gs==2);
figure
scatter(MedS(used1),MedM(used1),'b')
hold on
scatter(MedS(used2),MedM(used2),'r')
legend({'Control Cells','siRNA Cells'})
xlabel('Median CALM intensity of spots')
ylabel('Median Clathrin intensity of spots')

%%
used1=find(Gs==1);
used2=find(Gs==2);
figure
scatter(MedMS(used1),MedMM(used1),'b')
hold on
scatter(MedMS(used2),MedMM(used2),'r')
legend({'Control Cells','siRNA Cells'})
xlabel('Median MAX CALM intensity of traces')
ylabel('Median MAX Clathrin intensity of traces')