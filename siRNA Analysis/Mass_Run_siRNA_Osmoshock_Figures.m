Grouped=[];
for i=1:length(Titles)
    if strcmp(Titles{i},'WT Control')
        Grouped=[Grouped ; [1 Msd(i,1)]];
        Grouped=[Grouped ; [2 Msd(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 Msd(i,1)]];
        Grouped=[Grouped ; [4 Msd(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 Msd(i,1)]];
        Grouped=[Grouped ; [6 Msd(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 Msd(i,1)]];
        Grouped=[Grouped ; [2 Msd(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 Msd(i,1)]];
        Grouped=[Grouped ; [8 Msd(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 Msd(i,1)]];
        Grouped=[Grouped ; [10 Msd(i,2)]];
    end
end
figure
scatter(Grouped(:,1),Grouped(:,2))
hold on
for i=1:length(Grouped(:,1))/2
    plot(Grouped([2*i-1 2*i],1),Grouped([2*i-1 2*i],2))
end
Lab{1}='Control Before Treatment';
Lab{2}='Control After Treatment';
Lab{3}='Osmoshock Before Treatment';
Lab{4}='Osmoshock After Treatment';
Lab{5}='Post Osmoshock Before Treatment';
Lab{6}='Post Osmoshock After Treatment';
Lab{7}='siRNA control Before Treatment';
Lab{8}='siRNA control After Treatment';
Lab{9}='siRNA Osmoshock Before Treatment';
Lab{10}='siRNA Osmoshock After Treatment';
xticks(1:10)
xticklabels(Lab)
xtickangle(20)
ylabel('CALM Growth Rate Standard Deviation')

%%

Grouped=[];
for i=1:length(Titles)
    if strcmp(Titles{i},'WT Control')
        Grouped=[Grouped ; [1 Ssd(i,1)]];
        Grouped=[Grouped ; [2 Ssd(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 Ssd(i,1)]];
        Grouped=[Grouped ; [4 Ssd(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 Ssd(i,1)]];
        Grouped=[Grouped ; [6 Ssd(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 Ssd(i,1)]];
        Grouped=[Grouped ; [2 Ssd(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 Ssd(i,1)]];
        Grouped=[Grouped ; [8 Ssd(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 Ssd(i,1)]];
        Grouped=[Grouped ; [10 Ssd(i,2)]];
    end
end
figure
scatter(Grouped(:,1),Grouped(:,2))
hold on
for i=1:length(Grouped(:,1))/2
    plot(Grouped([2*i-1 2*i],1),Grouped([2*i-1 2*i],2))
end
Lab{1}='Control Before Treatment';
Lab{2}='Control After Treatment';
Lab{3}='Osmoshock Before Treatment';
Lab{4}='Osmoshock After Treatment';
Lab{5}='Post Osmoshock Before Treatment';
Lab{6}='Post Osmoshock After Treatment';
Lab{7}='siRNA control Before Treatment';
Lab{8}='siRNA control After Treatment';
Lab{9}='siRNA Osmoshock Before Treatment';
Lab{10}='siRNA Osmoshock After Treatment';
xticks(1:10)
xticklabels(Lab)
xtickangle(20)
ylabel('Clathrin Growth Rate Standard Deviation')

%%

Mat=MM;
Tit='Median Peak CALM Intensity';

Grouped=[];
for i=1:length(Titles)
    if strcmp(Titles{i},'WT Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 Mat(i,1)]];
        Grouped=[Grouped ; [4 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 Mat(i,1)]];
        Grouped=[Grouped ; [6 Mat(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 Mat(i,1)]];
        Grouped=[Grouped ; [8 Mat(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 Mat(i,1)]];
        Grouped=[Grouped ; [10 Mat(i,2)]];
    end
end
figure
scatter(Grouped(:,1),Grouped(:,2))
hold on
for i=1:length(Grouped(:,1))/2
    plot(Grouped([2*i-1 2*i],1),Grouped([2*i-1 2*i],2))
end
Lab{1}='Control Before Treatment';
Lab{2}='Control After Treatment';
Lab{3}='Osmoshock Before Treatment';
Lab{4}='Osmoshock After Treatment';
Lab{5}='Post Osmoshock Before Treatment';
Lab{6}='Post Osmoshock After Treatment';
Lab{7}='siRNA control Before Treatment';
Lab{8}='siRNA control After Treatment';
Lab{9}='siRNA Osmoshock Before Treatment';
Lab{10}='siRNA Osmoshock After Treatment';
xticks(1:10)
xticklabels(Lab)
xtickangle(20)
ylabel(Tit)

%%

Mat=MS;
Tit='Median Peak Clathrin Intensity';

Grouped=[];
for i=1:length(Titles)
    if strcmp(Titles{i},'WT Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 Mat(i,1)]];
        Grouped=[Grouped ; [4 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 Mat(i,1)]];
        Grouped=[Grouped ; [6 Mat(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 Mat(i,1)]];
        Grouped=[Grouped ; [8 Mat(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 Mat(i,1)]];
        Grouped=[Grouped ; [10 Mat(i,2)]];
    end
end
figure
scatter(Grouped(:,1),Grouped(:,2))
hold on
for i=1:length(Grouped(:,1))/2
    plot(Grouped([2*i-1 2*i],1),Grouped([2*i-1 2*i],2))
end
Lab{1}='Control Before Treatment';
Lab{2}='Control After Treatment';
Lab{3}='Osmoshock Before Treatment';
Lab{4}='Osmoshock After Treatment';
Lab{5}='Post Osmoshock Before Treatment';
Lab{6}='Post Osmoshock After Treatment';
Lab{7}='siRNA control Before Treatment';
Lab{8}='siRNA control After Treatment';
Lab{9}='siRNA Osmoshock Before Treatment';
Lab{10}='siRNA Osmoshock After Treatment';
xticks(1:10)
xticklabels(Lab)
xtickangle(20)
ylabel(Tit)

%%

Mat=MSr;
Tit='Median Peak CALM:Clathrin Ratio';

Grouped=[];
for i=1:length(Titles)
    if strcmp(Titles{i},'WT Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 Mat(i,1)]];
        Grouped=[Grouped ; [4 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 Mat(i,1)]];
        Grouped=[Grouped ; [6 Mat(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 Mat(i,1)]];
        Grouped=[Grouped ; [8 Mat(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 Mat(i,1)]];
        Grouped=[Grouped ; [10 Mat(i,2)]];
    end
end
figure
scatter(Grouped(:,1),Grouped(:,2))
hold on
for i=1:length(Grouped(:,1))/2
    plot(Grouped([2*i-1 2*i],1),Grouped([2*i-1 2*i],2))
end
Lab{1}='Control Before Treatment';
Lab{2}='Control After Treatment';
Lab{3}='Osmoshock Before Treatment';
Lab{4}='Osmoshock After Treatment';
Lab{5}='Post Osmoshock Before Treatment';
Lab{6}='Post Osmoshock After Treatment';
Lab{7}='siRNA control Before Treatment';
Lab{8}='siRNA control After Treatment';
Lab{9}='siRNA Osmoshock Before Treatment';
Lab{10}='siRNA Osmoshock After Treatment';
xticks(1:10)
xticklabels(Lab)
xtickangle(20)
ylabel(Tit)

%%

Mat=N;
Tit='Number of Full Traces';

Grouped=[];
for i=1:length(Titles)
    if strcmp(Titles{i},'WT Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 Mat(i,1)]];
        Grouped=[Grouped ; [4 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 Mat(i,1)]];
        Grouped=[Grouped ; [6 Mat(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 Mat(i,1)]];
        Grouped=[Grouped ; [8 Mat(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 Mat(i,1)]];
        Grouped=[Grouped ; [10 Mat(i,2)]];
    end
end
figure
scatter(Grouped(:,1),Grouped(:,2))
hold on
for i=1:length(Grouped(:,1))/2
    plot(Grouped([2*i-1 2*i],1),Grouped([2*i-1 2*i],2))
end
Lab{1}='Control Before Treatment';
Lab{2}='Control After Treatment';
Lab{3}='Osmoshock Before Treatment';
Lab{4}='Osmoshock After Treatment';
Lab{5}='Post Osmoshock Before Treatment';
Lab{6}='Post Osmoshock After Treatment';
Lab{7}='siRNA control Before Treatment';
Lab{8}='siRNA control After Treatment';
Lab{9}='siRNA Osmoshock Before Treatment';
Lab{10}='siRNA Osmoshock After Treatment';
xticks(1:10)
xticklabels(Lab)
xtickangle(20)
ylabel(Tit)

%%

for i=1:length(Msd(:,1))
    NMI(i,:)=MI(i,:)/MI(i,1);
end
for i=1:length(Msd(:,1))
    NSI(i,:)=SI(i,:)/SI(i,1);
end

%%

Mat=N;
Tit='Number of Full Traces';

Grouped=[];
for i=1:length(Titles)
    if strcmp(Titles{i},'WT Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 Mat(i,1)]];
        Grouped=[Grouped ; [4 Mat(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 Mat(i,1)]];
        Grouped=[Grouped ; [6 Mat(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 Mat(i,1)]];
        Grouped=[Grouped ; [2 Mat(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 Mat(i,1)]];
        Grouped=[Grouped ; [8 Mat(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 Mat(i,1)]];
        Grouped=[Grouped ; [10 Mat(i,2)]];
    end
end
figure
scatter(Grouped(:,1),Grouped(:,2))
hold on
for i=1:length(Grouped(:,1))/2
    plot(Grouped([2*i-1 2*i],1),Grouped([2*i-1 2*i],2))
end
Lab{1}='Control Before Treatment';
Lab{2}='Control After Treatment';
Lab{3}='Osmoshock Before Treatment';
Lab{4}='Osmoshock After Treatment';
Lab{5}='Post Osmoshock Before Treatment';
Lab{6}='Post Osmoshock After Treatment';
Lab{7}='siRNA control Before Treatment';
Lab{8}='siRNA control After Treatment';
Lab{9}='siRNA Osmoshock Before Treatment';
Lab{10}='siRNA Osmoshock After Treatment';
xticks(1:10)
xticklabels(Lab)
xtickangle(20)
ylabel(Tit)