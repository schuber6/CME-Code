clear all
folder='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies';
files=FindFiles(folder,'*.mat').';
AP2Movies=FindFiles(folder,'*AP2.tif');
CALMMovies=FindFiles(folder,'*CALM.tif');
for i0=1:3
    if ismember(i0,[1 2])
        Adaptor='CALM';
        movie=CALMMovies{i0};
    end
    if ismember(i0,[3])
        Adaptor='AP2';
        movie=AP2Movies{i0-2};
    end
    load(files{i0})
    newfiles{i0}=strcat(movie(1:end-4),'_3sCohortBox.tif');
Dividers=[1 61 121];
%[MIs,SIs,LTs]=ListAllTracesByFrame_MovieSections(FXYCMS,6,Dividers);
[MIs,SIs,LTs,LTvect{i0},IndVect{i0}]=ListAll3sByFrame_MovieSections(FXYCMS,6,Dividers);
%[MIs,SIs,LTs]=ListAll3sByFrame(FXYCMS,6);

Before=1:60;
After=61:120;
NumCohorts=4;
FrameGap=5;
CohortEdges=30:(120/NumCohorts):150;

%BoxByLifetimeCohort(FXYCMS,IndVect,LTvect,movie,newfiles{i0},CohortEdges/FrameGap)
PlotBestCohortTraces(FXYCMS,IndVect{i0},LTvect{i0},CohortEdges/FrameGap)

BM=cell(1,NumCohorts);
BS=cell(1,NumCohorts);
AM=cell(1,NumCohorts);
AS=cell(1,NumCohorts);

BAC=cell(1,NumCohorts);
AAC=cell(1,NumCohorts);

for i=Before
    for i2=1:length(LTs{i})
        for i3=1:NumCohorts
            if LTs{i}(i2)*FrameGap>=CohortEdges(i3) && LTs{i}(i2)*FrameGap<CohortEdges(i3+1)
                BM{i3}=[BM{i3} MIs{i}(i2)];
                BS{i3}=[BS{i3} SIs{i}(i2)];
                BAC{i3}=[BAC{i3} log(MIs{i}(i2)/SIs{i}(i2))];
            end
        end
    end
end
for i=After
    for i2=1:length(LTs{i})
        for i3=1:NumCohorts
            if LTs{i}(i2)*FrameGap>=CohortEdges(i3) && LTs{i}(i2)*FrameGap<CohortEdges(i3+1)
                AM{i3}=[AM{i3} MIs{i}(i2)];
                AS{i3}=[AS{i3} SIs{i}(i2)];
                AAC{i3}=[AAC{i3} log(MIs{i}(i2)/SIs{i}(i2))];
            end
        end
    end
end

%xbinsM=0:1500:30000;
%xbinsS=xbinsM;
xbinsAC=-2:.25:4;
Nbins=20;

FSFig()
%h=subplot(2,1,1);
L=cell(1,NumCohorts);
for i=1:NumCohorts
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort');
end

% for i=1:NumCohorts
%     Stacked1(i,:)=[NumCohorts 2 2*i-1];
%     Stacked2(i,:)=[NumCohorts 2 2*i];
% end
sides=ceil(sqrt(NumCohorts));
for i=1:NumCohorts
    Stacked1(i,:)=[3 NumCohorts i+2*NumCohorts];
end
[ArObj]=DrawHistCohortAreas(BAC,xbinsAC,Stacked1,1,1);
for i=1:NumCohorts
    subplot(Stacked1(i,1),Stacked1(i,2),Stacked1(i,3))
    title(L{i})
    xlabel(strcat('Log(',Adaptor, ':Clathrin Ratio)'))
    ylabel('Count')
end
%legend(fliplr(ArObj),fliplr(L));
%reorderLegend(order,h);


%subplot(2,1,2)
ArObj=DrawHistCohortAreas(AAC,xbinsAC,Stacked1,0,1);
for i=1:NumCohorts
    subplot(Stacked1(i,1),Stacked1(i,2),Stacked1(i,3))
    title(L{i})
    xlabel(strcat('Log(',Adaptor, ':Clathrin Ratio)'))
    ylabel('Count')
    legend('Before','After')
end
%legend(fliplr(ArObj),fliplr(L));

for i=1:NumCohorts
    Stacked1(i,:)=[3 NumCohorts i];
    Stacked2(i,:)=[3 NumCohorts i+NumCohorts];
end

%FSFig()
%subplot(2,2,1)
[ArObj,xbinsM]=DrawHistCohortAreas(BM,Nbins,Stacked1,1,1);
title('Before Osmoshock')
xlabel(strcat(Adaptor, ' Intensity'))
ylabel('Count')
%legend(fliplr(ArObj),fliplr(L));
%reorderLegend(order,h);


%subplot(2,2,3)
ArObj=DrawHistCohortAreas(AM,xbinsM,Stacked1,0,1);
title('After Osmoshock')
xlabel(strcat(Adaptor, ' Intensity'))
ylabel('Count')
%legend(fliplr(ArObj),fliplr(L));

%subplot(2,2,2)
[ArObj,xbinsS]=DrawHistCohortAreas(BS,Nbins,Stacked2,1,1);
title('Before Osmoshock')
xlabel('Clathrin Intensity')
ylabel('Count')
%legend(fliplr(ArObj),fliplr(L));

%subplot(2,2,4)
ArObj=DrawHistCohortAreas(AS,xbinsS,Stacked2,0,1);
title('After Osmoshock')
xlabel('Clathirn Intensity')
ylabel('Count')
%legend(fliplr(ArObj),fliplr(L));

for i=1:NumCohorts
    subplot(Stacked1(i,1),Stacked1(i,2),Stacked1(i,3))
    title(L{i})
    xlabel('Intensity')
    ylabel('Count')
    legend(strcat(Adaptor, ' Before'),strcat(Adaptor, ' After'))
end
for i=1:NumCohorts
    subplot(Stacked2(i,1),Stacked2(i,2),Stacked2(i,3))
    title(L{i})
    xlabel('Intensity')
    ylabel('Count')
    legend('Clathrin Before','Clathrin After')
end


end
