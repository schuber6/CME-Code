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
        [N{i}(i0)]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF);
        N{i}(i0)=N{i}(i0)/mean(RedArea(i0,:));
        CALM{i}(i0)=GreenCyt_BS(i0);
        Clath{i}(i0)=RedCyt_BS(i0);
    end
end

%%
Ns=[];
Cs=[];
Gs=[];
Rs=[];
for i=1:length(N)
    Ns=[Ns N{i}];
    Cs=[Cs CALM{i}];
    Rs=[Rs Clath{i}];
    for i2=1:length(N{i})
        if ~isempty(strfind(files{i}{i2},'wt'))
            Gs=[Gs 1];
        else
            Gs=[Gs 2];
        end
    end
end

for i=1:length(Gs)
    if Gs(i)==1
        Cols(i,:)=[0 0 1];
    else
        Cols(i,:)=[1 0 0];
    end
end

%%

figure
used1=find(Gs==1);
used2=find(Gs==2);
scatter(Cs(used1),Ns(used1),[],'b')
hold on
scatter(Cs(used2),Ns(used2),[],'r')
xlabel('25th percitile of CALM Intensity')
ylabel('Spot Density')
legend({'Control Cells','siRNA Cells'})

%%

figure
notBoxPlot(Ns,Gs)
hold on
xticklabels({'Control Cells','siRNA Cells'})
ylabel('Spot Density (#/um^2)')
used1=find(Gs==1);
used2=find(Gs==2);

[h,p]=ttest2(Ns(used1),Ns(used2));
sigstar([1 2],p)

%%

figure
notBoxPlot(Cs,Gs)
hold on
xticklabels({'Control Cells','siRNA Cells'})
ylabel('25th percitile of CALM Intensity')
used1=find(Gs==1);
used2=find(Gs==2);

[h,p]=ttest2(Ns(used1),Ns(used2));
sigstar([1 2],p)

%%

figure
used1=find(Gs==1);
used2=find(Gs==2);
scatter(Cs(used1),Rs(used1),[],'b')
hold on
scatter(Cs(used2),Rs(used2),[],'r')
xlabel('25th percitile of CALM Intensity')
ylabel('25th percitile of Clathrin Intensity')
legend({'Control Cells','siRNA Cells'})
        