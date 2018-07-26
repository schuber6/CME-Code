function CohortBoxplots(fileswt,filessi)

FXYCMSwt={};
FXYCMSsi={};

for i=1:length(fileswt)
    load(fileswt{i})
    FXYCMSwt=CombineCells(FXYCMSwt,FXYCMS);
end
for i=1:length(filessi)
    load(filessi{i})
    FXYCMSsi=CombineCells(FXYCMSsi,FXYCMS);
end
norm=1;
figure

[CALMwt,MaxCALMwt]=Temp_TwoColorCohorts_NPlots(FXYCMSwt,2,0,'',norm);
[Clathwt,MaxClathwt]=Temp_TwoColorCohorts_NPlots(FXYCMSwt,2,1,'',norm);
[CALMsi,MaxCALMsi]=Temp_TwoColorCohorts_NPlots(FXYCMSsi,2,0,'--',norm);
[Clathsi,MaxClathsi]=Temp_TwoColorCohorts_NPlots(FXYCMSsi,2,1,'--',norm);

for i=1:3
    CPwt(i)=length(CALMwt{i}{1});
    CPsi(i)=length(CALMsi{i}{1});
end
subplot(1,3,1)
legend('WT CALM','WT Clathrin','siRNA CALM','siRNA Clathrin','Best siRNA CALM','Best siRNA Clathrin')

Mca=0;
Mcl=0;
for i=1:length(MaxCALMwt)
    Mca=max(Mca,max(MaxCALMwt{i}));
    Mca=max(Mca,max(MaxCALMsi{i}));
    Mcl=max(Mcl,max(MaxClathwt{i}));
    Mcl=max(Mcl,max(MaxClathsi{i}));
end
figure
for i=1:length(MaxCALMwt)
    subplot(1,length(MaxCALMwt),i)
    boxplot([MaxCALMwt{i} MaxCALMsi{i}],[zeros(1,length(MaxCALMwt{i})) zeros(1,length(MaxCALMsi{i}))+1])
    ylim([0 Mca])
    xticklabels({'WT','SI'})
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