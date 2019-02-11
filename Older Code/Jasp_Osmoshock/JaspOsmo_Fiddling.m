Stalled=0;

files=FindFiles('E:\CME Superfolder\CME Data\190206_JaspOsmo\Day1\orig_movies','*.mat').';
JOcont={};
JO3={};
JO10={};
O3={};
O10={};
JOcont(end+1:end+7)=files(1:7);
JO10(end+1:end+4)=files(8:11);
JO3(end+1:end+4)=files(14:17);
O10(end+1:end+3)=files(18:20);
O3(end+1:end+2)=files(21:22);
files=FindFiles('E:\CME Superfolder\CME Data\190206_JaspOsmo\Day2\orig_movies','*.mat').';
JOcont(end+1:end+7)=files(1:7);
JO10(end+1:end+3)=files(8:10);
JO3(end+1:end+2)=files(13:14);
O10(end+1)=files(15);
O3(end+1)=files(16);
files=FindFiles('E:\CME Superfolder\CME Data\190206_JaspOsmo\Day3\orig_movies','*.mat').';
JOcont(end+1:end+5)=files(1:5);
O10(end+1)=files(9);
O3(end+1:end+3)=files(11:13);

JOData=struct();
ind=1;
for i=1:length(JOcont)
    JOData(ind).files=JOcont{i};
    JOData(ind).time=0;
    JOData(ind).treatment=0;
    ind=ind+1;
end
for i=1:length(JO10)
    JOData(ind).files=JO10{i};
    JOData(ind).time=10;
    JOData(ind).treatment=2;
    ind=ind+1;
end
for i=1:length(JO3)
    JOData(ind).files=JO3{i};
    JOData(ind).time=3;
    JOData(ind).treatment=2;
    ind=ind+1;
end
for i=1:length(O10)
    JOData(ind).files=O10{i};
    JOData(ind).time=10;
    JOData(ind).treatment=1;
    ind=ind+1;
end
for i=1:length(O3)
    JOData(ind).files=O3{i};
    JOData(ind).time=3;
    JOData(ind).treatment=1;
    ind=ind+1;
end

for i=1:length(JOData)
    load(JOData(i).files)
    JOData(i).LT=AverageLifetime(Threshfxyc,Stalled);
end

%%
clear C
Group{1}=find([JOData.time]==0);
Group{2}=find([JOData.time]==3 & [JOData.treatment]==1);
Group{3}=find([JOData.time]==10 & [JOData.treatment]==1);
Group{4}=find([JOData.time]==3 & [JOData.treatment]==2);
Group{5}=find([JOData.time]==10 & [JOData.treatment]==2);
figure
for i=1:length(Group)
    C{i}=[JOData(Group{i}).LT]*2;
end
BoxPlotCell(C,@notBoxPlot)
xticklabels({'Control','Osmoshock, 3 min','Osmoshock, 10 min','Jasp+Osmo, 3 min','Jasp+Osmo, 10 min'})
xtickangle(20)
ylabel('Average Lifetime (s)')

