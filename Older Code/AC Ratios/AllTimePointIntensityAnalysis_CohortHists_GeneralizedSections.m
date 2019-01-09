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

LengthMovie=240;
NSections=4;
NumCohorts=8;
FrameGap=5;
CohortEdges=30:(120/NumCohorts):150;

for i=1:NSections
    Section{i}=(LengthMovie/NSections*(i-1)+1):(LengthMovie/NSections*i);
    Tit{i}=strcat('Time Bin:',num2str((min(Section{i})-60)*FrameGap),'-',num2str((max(Section{i})-60)*FrameGap),'s');
end



for iS=1:NSections
BM{iS}=cell(1,NumCohorts);
BS{iS}=cell(1,NumCohorts);
BAC{iS}=cell(1,NumCohorts);
end

for iS=1:NSections
for i=Section{iS}
    for i2=1:length(LTs{i})
        for i3=1:NumCohorts
            if LTs{i}(i2)*FrameGap>=CohortEdges(i3) && LTs{i}(i2)*FrameGap<CohortEdges(i3+1)
                BM{iS}{i3}=[BM{iS}{i3} MIs{i}(i2)];
                BS{iS}{i3}=[BS{iS}{i3} SIs{i}(i2)];
                BAC{iS}{i3}=[BAC{iS}{i3} log(MIs{i}(i2)/SIs{i}(i2))];
            end
        end
    end
end
end


%xbinsM=0:1500:30000;
%xbinsS=xbinsM;
xbinsAC=-2:.25:4;
Nbins=20;

FSFig()

L=cell(1,NumCohorts);
for i=1:NumCohorts
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort');
end

for iS=1:NSections
    subplot(NSections,1,iS);
    [ArObj]=DrawHistCohortAreas(BAC{iS},xbinsAC,1);
    title(Tit{iS})
    xlabel(strcat('Log(',Adaptor, ':Clathrin Ratio)'))
    ylabel('Count')
    legend(fliplr(ArObj),fliplr(L));
end

FSFig()
for iS=1:NSections
    subplot(NSections,2,iS*2-1)
    if iS==1
        [ArObj,xbinsM]=DrawHistCohortAreas(BM{iS},Nbins,1);
    else
        [ArObj]=DrawHistCohortAreas(BM{iS},xbinsM);
    end
    title(Tit{iS})
    xlabel(strcat(Adaptor, ' Intensity'))
    ylabel('Count')
    legend(fliplr(ArObj),fliplr(L));
    
    subplot(NSections,2,iS*2)
    if iS==1
        [ArObj,xbinsS]=DrawHistCohortAreas(BS{iS},Nbins,1);
    else
        [ArObj]=DrawHistCohortAreas(BS{iS},xbinsS);
    end
    title(Tit{iS})
    xlabel(strcat('Clathrin', ' Intensity'))
    ylabel('Count')
    legend(fliplr(ArObj),fliplr(L));
end
%reorderLegend(order,h);
% 
% 
% subplot(2,2,3)
% ArObj=DrawHistCohortAreas(AM,xbinsM);
% title('After Osmoshock')
% xlabel(strcat(Adaptor, ' Intensity at Internalization'))
% ylabel('Count')
% legend(fliplr(ArObj),fliplr(L));
% 
% subplot(2,2,2)
% [ArObj,xbinsS]=DrawHistCohortAreas(BS,Nbins,1);
% title('Before Osmoshock')
% xlabel('Clathrin Intensity at Internalization')
% ylabel('Count')
% legend(fliplr(ArObj),fliplr(L));
% 
% subplot(2,2,4)
% ArObj=DrawHistCohortAreas(AS,xbinsS);
% title('After Osmoshock')
% xlabel('Clathirn Intensity at Internalization')
% ylabel('Count')
% legend(fliplr(ArObj),fliplr(L));


end
