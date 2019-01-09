clear NAwt NAsi Nwt Nsi
CohortEdges=[30 60 90 120];
for i=1:2
    load(DataWT(i).file)
    Nt=FindCohortPopulations(FXYCMS,CohortEdges);
    NAwt(i,:)=Nt/DataWT(i).Area;
    Nwt(i,:)=Nt/sum(Nt);
end
for i=1:4
    load(DataSI(i).file)
    Nt=FindCohortPopulations(FXYCMS,CohortEdges);
    NAsi(i,:)=Nt/DataSI(i).Area;
    Nsi(i,:)=Nt/sum(Nt);
end
figure
Obj=bar([NAwt ; NAsi],'stacked');
% figure
% Obj=bar(Navi/5,'stacked');
L={'30-60s Pits','60-90s Pits','90-120s Pits','Stalled Structures'};
legend(fliplr(Obj),fliplr(L));
ylabel('Traces/um^2/min')
%ylim([0 1])
xticklabels({'CALM siRNA','Control'})

figure
Obj=bar([Nwt ; Nsi],'stacked');
% figure
% Obj=bar(Navi/5,'stacked');
L={'30-60s Pits','60-90s Pits','90-120s Pits','Stalled Structures'};
legend(fliplr(Obj),fliplr(L));
ylabel('Traces/um^2/min')
%ylim([0 1])
xticklabels({'CALM siRNA','Control'})

figure
Obj=bar([mean(NAwt) ; mean(NAsi)],'stacked');
L={'30-60s Pits','60-90s Pits','90-120s Pits','Stalled Structures'};
legend(fliplr(Obj),fliplr(L));
ylabel('Traces/um^2/min')
%ylim([0 1])
 xticklabels({'Control','CALM siRNA'})

%%
FSFig
for i=1:2
    subplot(1,2,i)
    load(DataWT(i).file)
    TwoColorCohorts_OnePlot(FXYCMS,3,0,'',1);
    TwoColorCohorts_OnePlot(FXYCMS,3,1,'',1);
end
FSFig
for i=1:4
    subplot(2,4,i)
    load(DataSI(i).file)
    TwoColorCohorts_OnePlot(FXYCMS,3,0,'--',1);
    TwoColorCohorts_OnePlot(FXYCMS,3,1,'--',1);
end

%%


    fxyc={};
for i=1:2

    load(DataWT(i).file)
    fxyc=CombineCells(fxyc,FXYCMS);
end
    figure(1)
    TwoColorCohorts_NPlots(fxyc,3,0,'',1);
    figure(2)
    TwoColorCohorts_NPlots(fxyc,3,1,'',1);

    fxyc={};
for i=1:4

    load(DataSI(i).file)
    fxyc=CombineCells(fxyc,FXYCMS);

end
    figure(1)
    TwoColorCohorts_NPlots(fxyc,3,0,'--',1);
    legend('WT','siRNA')
    figure(2)
    TwoColorCohorts_NPlots(fxyc,3,1,'--',1);
    legend('WT','siRNA')
    
    %%
    

for i=1:2

    load(DataWT(i).file)
    figure(1)
    TwoColorCohorts_NPlots(FXYCMS,3,0,'',1);
    figure(2)
    TwoColorCohorts_NPlots(FXYCMS,3,1,'',1);
end


    fxyc={};
for i=1:4

    load(DataSI(i).file)
    figure(1)
    TwoColorCohorts_NPlots(FXYCMS,3,0,'--',1);
    figure(2)
    TwoColorCohorts_NPlots(FXYCMS,3,1,'--',1);

end

    
    %%
    clear NAwtI NAwtC NAsiI NAsiC
    MaxFrame=100;
    Tmast=3000;
    Tslave=3000;
    for i=1:2
        load(DataWT(i).file)
        [Ni(i),Nc(i)]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave);
        NAwtI(i)=Ni(i)/DataWT(i).Area;
        NAwtC(i)=Nc(i)/DataWT(i).Area;
    end
    for i=1:4
        load(DataSI(i).file)
        [Ni(i),Nc(i)]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave);
        NAsiI(i)=Ni(i)/DataSI(i).Area;
        NAsiC(i)=Nc(i)/DataSI(i).Area;
    end
    Ni=[NAwtI NAsiI];
    Nc=[NAwtC NAsiC];
    Niwtav=mean(NAwtI);
    Nisiav=mean(NAsiI);
    Ncwtav=mean(NAwtC);
    Ncsiav=mean(NAsiC);
    figure
    bar([Ni.' Nc.']/5)
    M=[[Niwtav Ncwtav];[Nisiav Ncsiav]];
    figure
    bar(M/5)
    xticklabels({'Control','CALM siRNA'})
    
    %%
    clear Hsi_wt Hsi_si
    LTbins=10:3:50;
    figure
    ind=1;
    for i=1:2
        load(DataWT(i).file)
        subplot(3,3,ind)
        ind=ind+1;
        [Hsi_wt(i,:),xbins]=PlotLifetimeHistogram(FXYCMS,LTbins);
    end
    for i=1:4
        load(DataSI(i).file)
        subplot(3,3,ind)
        ind=ind+1;
        [Hsi_si(i,:),xbins]=PlotLifetimeHistogram(FXYCMS,LTbins);
    end
    Hwt=sum(Hsi_wt);
    Hsi=sum(Hsi_si);
    figure
    plot(xbins*3,Hwt/sum(Hwt),'g')
    hold on
    plot(xbins*3,Hsi/sum(Hsi),'r')
    legend('WT','siRNA')
    xlabel('Lifetime (s)')
    ylabel('Frequency')
    

