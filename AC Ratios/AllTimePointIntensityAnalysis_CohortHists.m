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

[MIs,SIs,LTs]=ListAll3sByFrame(FXYCMS,6);

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
h=subplot(2,1,1);
L=cell(1,NumCohorts);
for i=1:NumCohorts
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort');
end

[ArObj]=DrawHistCohortAreas(BAC,xbinsAC,[],1);
title('Before Osmoshock')
xlabel(strcat('Log(',Adaptor, ':Clathrin Ratio) at Internalization'))
ylabel('Count')
legend(fliplr(ArObj),fliplr(L));
%reorderLegend(order,h);


subplot(2,1,2)
ArObj=DrawHistCohortAreas(AAC,xbinsAC,[]);
title('After Osmoshock')
xlabel(strcat('Log(',Adaptor, ':Clathrin Ratio) at Internalization'))
ylabel('Count')
legend(fliplr(ArObj),fliplr(L));

FSFig()
subplot(2,2,1)
[ArObj,xbinsM]=DrawHistCohortAreas(BM,Nbins,[],1);
title('Before Osmoshock')
xlabel(strcat(Adaptor, ' Intensity at Internalization'))
ylabel('Count')
legend(fliplr(ArObj),fliplr(L));
%reorderLegend(order,h);


subplot(2,2,3)
ArObj=DrawHistCohortAreas(AM,xbinsM,[]);
title('After Osmoshock')
xlabel(strcat(Adaptor, ' Intensity at Internalization'))
ylabel('Count')
legend(fliplr(ArObj),fliplr(L));

subplot(2,2,2)
[ArObj,xbinsS]=DrawHistCohortAreas(BS,Nbins,[],1);
title('Before Osmoshock')
xlabel('Clathrin Intensity at Internalization')
ylabel('Count')
legend(fliplr(ArObj),fliplr(L));

subplot(2,2,4)
ArObj=DrawHistCohortAreas(AS,xbinsS,[]);
title('After Osmoshock')
xlabel('Clathirn Intensity at Internalization')
ylabel('Count')
legend(fliplr(ArObj),fliplr(L));


end
