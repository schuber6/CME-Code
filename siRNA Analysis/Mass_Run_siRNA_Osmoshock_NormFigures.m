for i=1:length(Msd(:,1))
    NMsd(i,:)=Msd(i,:)/Msd(i,1);
end
for i=1:length(Msd(:,1))
    NSsd(i,:)=Ssd(i,:)/Ssd(i,1);
end
for i=1:length(Msd(:,1))
    NMM(i,:)=MM(i,:)/MM(i,1);
end
for i=1:length(Msd(:,1))
    NMS(i,:)=MS(i,:)/MS(i,1);
end
for i=1:length(Msd(:,1))
    NMSr(i,:)=MSr(i,:)/MSr(i,1);
end
for i=1:length(Msd(:,1))
    NMI(i,:)=MI(i,:)/MI(i,1);
end
for i=1:length(Msd(:,1))
    NSI(i,:)=SI(i,:)/SI(i,1);
end


%%
Grouped=[];
for i=1:length(Titles)
    if strcmp(Titles{i},'WT Control')
        Grouped=[Grouped ; [1 NMsd(i,1)]];
        Grouped=[Grouped ; [2 NMsd(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 NMsd(i,1)]];
        Grouped=[Grouped ; [4 NMsd(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 NMsd(i,1)]];
        Grouped=[Grouped ; [6 NMsd(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 NMsd(i,1)]];
        Grouped=[Grouped ; [2 NMsd(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 NMsd(i,1)]];
        Grouped=[Grouped ; [8 NMsd(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 NMsd(i,1)]];
        Grouped=[Grouped ; [10 NMsd(i,2)]];
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
        Grouped=[Grouped ; [1 NSsd(i,1)]];
        Grouped=[Grouped ; [2 NSsd(i,2)]];
    end
    if strcmp(Titles{i},'WT Osmoshock')
        Grouped=[Grouped ; [3 NSsd(i,1)]];
        Grouped=[Grouped ; [4 NSsd(i,2)]];
    end
    if strcmp(Titles{i},'WT Post Osmoshock')
        Grouped=[Grouped ; [5 NSsd(i,1)]];
        Grouped=[Grouped ; [6 NSsd(i,2)]];
    end
    if strcmp(Titles{i},'Control')
        Grouped=[Grouped ; [1 NSsd(i,1)]];
        Grouped=[Grouped ; [2 NSsd(i,2)]];
    end

    if strcmp(Titles{i},'siRNA control')
        Grouped=[Grouped ; [7 NSsd(i,1)]];
        Grouped=[Grouped ; [8 NSsd(i,2)]];
    end
    if strcmp(Titles{i},'siRNA Osmoshock')
        Grouped=[Grouped ; [9 NSsd(i,1)]];
        Grouped=[Grouped ; [10 NSsd(i,2)]];
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

Mat=NMM;
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

Mat=NMS;
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

Mat=NMSr;
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

Mat=NSI;
Tit='Median AP2 Intensity of All Spots';

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

Mat=NMI;
Tit='Median CALM Intensity of All Spots';

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