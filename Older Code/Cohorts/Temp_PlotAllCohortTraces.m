folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Red_FXYCMS*');

    load(files{1})
NumCohorts=4;
FrameGap=3;
CohortEdges=30:(60/NumCohorts):90;
[Mints,Sints,~,Inds]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,3,0,100);
i0=1;
FXYCMS_Sel={};
ind=1;
for i=1:length(Inds{i0})
    FXYCMS_Sel{ind}=FXYCMS{Inds{i0}(i)};
    ind=ind+1;
end
load(files{1})
movieR=strcat(files{1}(1:end-11),'.tif');
movieG=strcat(files{1}(1:end-14),'Green.tif');

% filetst='CohortTest.mat';
% tracest=FXYCMS2Tracest(FXYCMS_Sel,'Slave');
% save(filetst,'tracest')
% figure_code_for_scott(movieR,movieR,filetst);

PlotAllMints(Mints{2},Sints{2},FrameGap,1)