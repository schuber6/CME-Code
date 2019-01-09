folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*.mat');
load(files{2});

CohortEdgesF=[10 20 30 40 50];
FG=3;
ind=1;
GoodFXYCMS={};
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(1,4)==3 && max(fxyc(:,1))<=120
        GoodFXYCMS{ind}=fxyc;
        ind=ind+1;
    end
end
[Mints,Sints]=SeparateTracesByCohort_FXYCMS(GoodFXYCMS,CohortEdgesF,1);
figure
for i=1:length(Mints)
    CMTrace{i}=StatCell(Mints{i},'mean');
    CSTrace{i}=StatCell(Sints{i},'mean');
    N(i)=length(Mints{i}{1});
    subplot(1,2,1)
    t=1:length(CMTrace{i});
    t=t*3;
    plot(t,CMTrace{i})
    hold on
    subplot(1,2,2)
    plot(t,CSTrace{i})
    hold on
    L{i}=strcat('<',num2str(CohortEdgesF(i+1)*FG),'s Traces. N=',num2str(N(i)));

end
subplot(1,2,1)
legend(L)
title('AP2')
subplot(1,2,2)
legend(L)
title('CALM')