clear all
folder='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies';
files=FindFiles(folder,'*.mat');
for i0=1:3
    if ismember(i0,[1 2])
        Adaptor='CALM';
    end
    if ismember(i0,[3])
        Adaptor='AP2';
    end
    load(files{i0})

[Inits,Concs]=InitiationConclusionIndices_FXYCMS(FXYCMS);

[ConcsMI,ConcsSI,MI,SI,ConcsLT]=TabulateConclusionIntensity(Inits,Concs,FXYCMS);

Before=1:60;
After=61:120;
NumCohorts=8;
FrameGap=3;
CohortEdges=30:(120/NumCohorts):150;


BM=cell(1,NumCohorts);
BS=cell(1,NumCohorts);
AM=cell(1,NumCohorts);
AS=cell(1,NumCohorts);

BAC=cell(1,NumCohorts);
AAC=cell(1,NumCohorts);

for i=Before
    for i2=1:length(ConcsLT{i})
        for i3=1:NumCohorts
            if ConcsLT{i}(i2)*FrameGap>=CohortEdges(i3) && ConcsLT{i}(i2)*FrameGap<CohortEdges(i3+1)
                BM{i3}=[BM{i3} ConcsMI{i}(i2)];
                BS{i3}=[BS{i3} ConcsSI{i}(i2)];
                BAC{i3}=[BAC{i3} log(ConcsMI{i}(i2)/ConcsSI{i}(i2))];
            end
        end
    end
end
for i=After
    for i2=1:length(ConcsLT{i})
        for i3=1:NumCohorts
            if ConcsLT{i}(i2)*FrameGap>=CohortEdges(i3) && ConcsLT{i}(i2)*FrameGap<CohortEdges(i3+1)
                AM{i3}=[AM{i3} ConcsMI{i}(i2)];
                AS{i3}=[AS{i3} ConcsSI{i}(i2)];
                AAC{i3}=[AAC{i3} log(ConcsMI{i}(i2)/ConcsSI{i}(i2))];
            end
        end
    end
end

%xbinsM=0:1500:30000;
%xbinsS=xbinsM;
Nbins=20;

FSFig()
h=subplot(2,1,1);
L=cell(1,NumCohorts);
for i=1:NumCohorts
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort');
end

[ArObj,xbinsM]=DrawHistCohortAreas(BAC,Nbins,1);
title('Before Osmoshock')
xlabel(strcat('Log(',Adaptor, ':Clathrin Ratio) at Internalization'))
ylabel('Count')
legend(fliplr(ArObj),fliplr(L));
%reorderLegend(order,h);


subplot(2,1,2)
ArObj=DrawHistCohortAreas(AAC,xbinsM);
title('After Osmoshock')
xlabel(strcat('Log(',Adaptor, ':Clathrin Ratio) at Internalization'))
ylabel('Count')
legend(fliplr(ArObj),fliplr(L));


end