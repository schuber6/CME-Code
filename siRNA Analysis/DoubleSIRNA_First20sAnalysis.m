folderwt='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
foldersi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
folderdsi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';
fileswt=FindFiles(folderwt,'*Red*.mat');
filessi=FindFiles(foldersi,'*Red*.mat');
filesdsi=FindFiles(folderdsi,'*Red*.mat');
FXYCMSwt={};
FXYCMSsi={};
FXYCMSdsi={};

tempsi{1}=filesdsi{5};
tempsi{2}=filesdsi{6};
tempdsi{1}=filessi{5};
filessi{5}=tempsi{1};
filessi{6}=tempsi{2};
filesdsi{5}=tempdsi{1};
inds=[1 2 3 4 5 7];
for i=1:6
    tfilesdsi{i}=filesdsi{inds(i)};
end
filesdsi=tfilesdsi;


for i=1:length(fileswt)
    load(fileswt{i})
    FXYCMSwt=CombineCells(FXYCMSwt,FXYCMS);
end
for i=1:length(filessi)
    load(filessi{i})
    FXYCMSsi=CombineCells(FXYCMSsi,FXYCMS);
end
for i=1:length(filesdsi)
    load(filesdsi{i})
    FXYCMSdsi=CombineCells(FXYCMSdsi,FXYCMS);
end
norm=1;
figure

[CALMwt,A,MaxCALMwt]=Temp_TwoColorCohorts_First_10s(FXYCMSwt,2,0,'',norm);
[Clathwt,B,MaxClathwt]=Temp_TwoColorCohorts_First_10s(FXYCMSwt,2,1,'',norm);
[CALMsi,C,MaxCALMsi]=Temp_TwoColorCohorts_First_10s(FXYCMSsi,2,0,'--',norm);
[Clathsi,D,MaxClathsi]=Temp_TwoColorCohorts_First_10s(FXYCMSsi,2,1,'--',norm);
[CALMdsi,E,MaxCALMdsi]=Temp_TwoColorCohorts_First_10s(FXYCMSdsi,2,0,':',norm);
[Clathdsi,F,MaxClathdsi]=Temp_TwoColorCohorts_First_10s(FXYCMSdsi,2,1,':',norm);

for i=1:3
    CPwt(i)=length(CALMwt{i}{1});
    CPsi(i)=length(CALMsi{i}{1});
    CPdsi(i)=length(CALMdsi{i}{1});
end
subplot(1,3,1)
legend('WT CALM','WT Clathrin','siRNA CALM','siRNA Clathrin','Best siRNA CALM','Best siRNA Clathrin')

%%

MGFPINT=18400/80/300*999;
N=MGFPINT;


Mca=0;
Mcl=0;
for i=1:length(MaxCALMwt)
    Mca=max(Mca,max(MaxCALMwt{i}));
    Mca=max(Mca,max(MaxCALMsi{i}));
    Mca=max(Mca,max(MaxCALMdsi{i}));
    Mcl=max(Mcl,max(MaxClathwt{i}));
    Mcl=max(Mcl,max(MaxClathsi{i}));
    Mcl=max(Mcl,max(MaxClathdsi{i}));
end
figure
for i=1:length(MaxCALMwt)
    subplot(1,length(MaxCALMwt),i)
    boxplot([MaxCALMwt{i} MaxCALMsi{i} MaxCALMdsi{i}],[zeros(1,length(MaxCALMwt{i})) zeros(1,length(MaxCALMsi{i}))+1 zeros(1,length(MaxCALMdsi{i}))+2])
    ylim([0 Mca])
    xticklabels({'WT','SI','DSI'})
    if i==1
        title('10-24s Cohort')
        ylabel('Maximum CALM Intensity')
    end
    if i==2
        title('24-80s Cohort')
    end
    if i==3
        title('80-150s Cohort')
    end
    %     subplot(1,3,i+3)
    %     boxplot([MaxClathwt{i} MaxClathsi{i} MaxClathdsi{i}],[zeros(1,length(MaxCALMwt{i})) zeros(1,length(MaxCALMsi{i}))+1 zeros(1,length(MaxCALMdsi{i}))+2])
    %     ylim([0 Mcl])
    %     xticklabels({'WT','SI','DSI'})
end

figure
inds=[1 5];
for i=1:length(MaxCALMwt)
    subplot(1,length(MaxCALMwt),i)
    boxplot([MaxCALMwt{i}/N MaxCALMsi{i}/N MaxCALMdsi{i}/N],[zeros(1,length(MaxCALMwt{i})) zeros(1,length(MaxCALMsi{i}))+1 zeros(1,length(MaxCALMdsi{i}))+2])
    ylim([0 Mca/N])
    xticklabels({'WT','SI','DSI'})
    if i0==1
        title('10-20s Cohort')
        ylabel('Maximum CALM Number')
    end
    if i0==2
        title('50-60s Cohort')
    end
%     if i==3
%         title('80-150s Cohort')
%     end
    ylim([0 100])
    %     subplot(1,3,i+3)
    %     boxplot([MaxClathwt{i} MaxClathsi{i} MaxClathdsi{i}],[zeros(1,length(MaxCALMwt{i})) zeros(1,length(MaxCALMsi{i}))+1 zeros(1,length(MaxCALMdsi{i}))+2])
    %     ylim([0 Mcl])
    %     xticklabels({'WT','SI','DSI'})
end