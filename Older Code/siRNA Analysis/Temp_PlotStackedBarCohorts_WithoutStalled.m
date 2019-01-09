clear N Ni Nav
FrameGap=3;
folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
for i0=1:length(files)
    load(files{i0});
    NumCohorts=5;
    %FrameGap=3;
    %CohortEdges=30:(90/NumCohorts):120;
    CohortEdges=[21 45 90 135];
    CohortEdgesF=CohortEdges/FrameGap;
    xbinsAC=-2:.25:4;
    Nbins=20;
    
    BM=cell(1,NumCohorts);
    BS=cell(1,NumCohorts);
    BAC=cell(1,NumCohorts);
    
    [Mints,Sints,Nt]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,100);
%     F2=SelectLargeOnes(FXYCMS);
%     Nt=[Nt length(F2)];
    %Nt=Nt/sum(Nt);
    N(i0,:)=Nt;
    Ni(i0,:)=Nt/Area(i0);

end
    Nav=sum(N);
    Navi=mean(Ni);

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Red_FXYCMS*');
for i=1:length(files)
    load(files{i})
    [Mints,Sints,Nt]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,100);
%     F2=SelectLargeOnes(FXYCMS);
%     Nt=[Nt length(F2)];
    %Nt=Nt/sum(Nt);
    N(26,:)=Nt;
    Nav(2,:)=Nt;
    Ni(26,:)=Nt/Area_WT_009;
    Navi(2,:)=Ni(26,:);
end

% folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
% files=FindFiles(folder,'170409*003*Red_FXYCMS*');
% for i=1:length(files)
%     load(files{i})
%     [Mints,Sints,Nt]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,100);
%     F2=SelectLargeOnes(FXYCMS);
%     Nt=[Nt length(F2)];
%     %Nt=Nt/sum(Nt);
%     N(27,:)=Nt;
%     Nav(2,:)=Nav(2,:)+Nt;
% end

for i=1:2
    Nav(i,:)=Nav(i,:)/sum(Nav(i,:));
end
figure
bar(Ni,'stacked')
figure
Obj=bar(Nav,'stacked');
L={'0-45s Pits','45-90s Pits','90-135s Pits'};
legend(fliplr(Obj),fliplr(L));
ylabel('Traces/um^2/min')
%ylim([0 1])
xticklabels({'CALM siRNA','Control'})