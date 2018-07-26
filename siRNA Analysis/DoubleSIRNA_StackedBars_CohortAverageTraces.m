clear all
load('DoubleSIRNA_ManualCytosolData.mat')
CBS_DSI=CBS_DSI([1 3 4 5 6 7 8]);
Area_DSI=Area_DSI([1 3 4 5 6 7 8]);

folderwt='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
foldersi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
folderdsi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';
fileswt=FindFiles(folderwt,'*Red*.mat');
filessi=FindFiles(foldersi,'*Red*.mat');
filesdsi=FindFiles(folderdsi,'*Red*.mat');

%Resort cells into more accurate groups
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
ASI=[Area_SI(1:4) Area_DSI(5:6)];
ADSI=[Area_DSI([1 2 3 4 7]) Area_SI(5)];
Area_SI=ASI;
Area_DSI=ADSI;


for i=1:length(fileswt)
    figure
    load(fileswt{i})
    FXYCMS_Sel=SelectSmallOnes(FXYCMS);
    subplot(2,5,i)
    CALMwtC{i}=Temp_TwoColorCohorts_NPlots(FXYCMS,2,0,'',1);
    Temp_TwoColorCohorts_NPlots(FXYCMS,2,1,'',1);
    Stallwt{i}=FindFullMovieTraces(FXYCMS);
end
for i=1:length(filessi)
    figure
    load(filessi{i})
    FXYCMS_Sel=SelectSmallOnes(FXYCMS);
    subplot(2,5,i)
    CALMsiC{i}=Temp_TwoColorCohorts_NPlots(FXYCMS,2,0,'',1) ;
    Temp_TwoColorCohorts_NPlots(FXYCMS,2,1,'',1);
    Stallsi{i}=FindFullMovieTraces(FXYCMS);
end
for i=1:length(filesdsi)
    figure
    load(filesdsi{i})
    FXYCMS_Sel=SelectSmallOnes(FXYCMS);
    subplot(2,5,i)
    CALMdsiC{i}=Temp_TwoColorCohorts_NPlots(FXYCMS,2,0,'',1) ;
    Temp_TwoColorCohorts_NPlots(FXYCMS,2,1,'',1);
    Stalldsi{i}=FindFullMovieTraces(FXYCMS);
end
for i=1:length(CALMwtC)
    for i2=1:length(CALMwtC{i})
        Pwt(i,i2)=length(CALMwtC{i}{i2}{1});
        Psi(i,i2)=length(CALMsiC{i}{i2}{1});
    end
    Pwt(i,length(CALMwtC{i})+1)=length(Stallwt{i});
    Psi(i,length(CALMsiC{i})+1)=length(Stallsi{i});
    PwtNA(i,:)=Pwt(i,:)/Area_WT(i);
    PsiNA(i,:)=Psi(i,:)/Area_SI(i);
    Pwtp(i,:)=Pwt(i,:)/sum(Pwt(i,:));
    Psip(i,:)=Psi(i,:)/sum(Psi(i,:));
end
for i=1:length(CALMdsiC)
    for i2=1:length(CALMdsiC{i})
        Pdsi(i,i2)=length(CALMdsiC{i}{i2}{1});
    end
    Pdsi(i,length(CALMdsiC{i})+1)=length(Stalldsi{i});
    PdsiNA(i,:)=Pdsi(i,:)/Area_DSI(i);
    Pdsip(i,:)=Pdsi(i,:)/sum(Pdsi(i,:));
end
AvPsi=mean(Psi);
AvPdsi=mean(Pdsi);
AvPwt=mean(Pwt);
AvPsiNA=mean(PsiNA);
AvPdsiNA=mean(PdsiNA);
AvPwtNA=mean(PwtNA);
AvPsi=AvPsi/sum(AvPsi);
AvPwt=AvPwt/sum(AvPwt);
AvPdsi=AvPdsi/sum(AvPdsi);
close all
figure
Obj=bar([Pwtp ; zeros(1,length(Pwtp(1,:))) ; Psip ; zeros(1,length(Pwtp(1,:))) ; Pdsip],'stacked');
L={'10-24s Pits','24-80s Pits','80-150s Pits','300s Pits (Entire Movie)'};
legend(fliplr(Obj),fliplr(L));
xticks([3 9 15])
xticklabels({'WT Cells','siRNA Cells with best Clathrin signal','siRNA Cells with Lowest CALM signal'})
ylabel('Percent of Traces')

figure
Obj=bar([AvPwt ; AvPsi ; AvPdsi],'stacked');
L={'10-24s Pits','24-80s Pits','80-150s Pits','300s Pits (Entire Movie)'};
legend(fliplr(Obj),fliplr(L));
xticks([1 2 3])
xticklabels({'WT Cells','siRNA Cells with best Clathrin signal','siRNA Cells with Lowest CALM signal'})
ylabel('Percent of Traces')

figure
Obj=bar([PwtNA ; zeros(1,length(Pwtp(1,:))) ; PsiNA ; zeros(1,length(Pwtp(1,:))) ; PdsiNA],'stacked');
L={'10-24s Pits','24-80s Pits','80-150s Pits','300s Pits (Entire Movie)'};
legend(fliplr(Obj),fliplr(L));
xticks([3 9 15])
xticklabels({'WT Cells','siRNA Cells with best Clathrin signal','siRNA Cells with Lowest CALM signal'})
ylabel('Percent of Traces')

figure
Obj=bar([AvPwtNA ; AvPsiNA ; AvPdsiNA],'stacked');
L={'10-24s Pits','24-80s Pits','80-150s Pits','300s Pits (Entire Movie)'};
legend(fliplr(Obj),fliplr(L));
xticks([1 2 3])
xticklabels({'WT Cells','siRNA Cells with best Clathrin signal','siRNA Cells with Lowest CALM signal'})
ylabel('Traces/um^2')
% for i=1:length(filessi)
%     load(filessi{i})
%     FXYCMS_Sel=SelectSmallOnes(FXYCMS);
%     subplot(2,5,i+5)
%     TwoColorCohorts_OnePlot(FXYCMS,2,0,'',1)   
% end
% for i=1:length(fileswt)
%     load(fileswt{i})
%     FXYCMS_Sel=SelectSmallOnes(FXYCMS);
%     subplot(2,5,i)
%     TwoColorCohorts_OnePlot(FXYCMS,2,1,'',1)   
% end
% for i=1:length(filessi)
%     load(filessi{i})
%     FXYCMS_Sel=SelectSmallOnes(FXYCMS);
%     subplot(2,5,i+5)
%     TwoColorCohorts_OnePlot(FXYCMS,2,1,'',1)   
% end

%%

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

[CALMwt,MaxCALMwt]=Temp_TwoColorCohorts_NPlots(FXYCMSwt,2,0,'',norm);
[Clathwt,MaxClathwt]=Temp_TwoColorCohorts_NPlots(FXYCMSwt,2,1,'',norm);
[CALMsi,MaxCALMsi]=Temp_TwoColorCohorts_NPlots(FXYCMSsi,2,0,'--',norm);
[Clathsi,MaxClathsi]=Temp_TwoColorCohorts_NPlots(FXYCMSsi,2,1,'--',norm);
[CALMdsi,MaxCALMdsi]=Temp_TwoColorCohorts_NPlots(FXYCMSdsi,2,0,':',norm);
[Clathdsi,MaxClathdsi]=Temp_TwoColorCohorts_NPlots(FXYCMSdsi,2,1,':',norm);

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
for i0=1:2
    i=inds(i0);
    subplot(1,length(inds),i0)
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

%%
%CD=cdf([MaxCALMsi{i}/N MaxCALMdsi{i}/N],0:5:100);
%figure
subplot(1,2,1)
%plot(0:5:100,CD)
X=[MaxCALMsi{1}/N MaxCALMdsi{1}/N];
h=hist(X,0:5:100);
for i=1:length(h)
    h2(i)=sum(h(1:i));
end
plot(0:5:100,h2/max(h2))
xlim([0 40])
xlabel('Max # CALM')
ylabel('CDF')
title('0-20s Cohort')

