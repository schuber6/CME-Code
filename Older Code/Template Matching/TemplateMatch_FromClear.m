clear all
Cutoff=12;
folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
i=12;
load(files{i})

[ManI,~,Inds]=Make_SCellF(FXYCMS);
load('E:\CME Superfolder\Old Data\AP2_SCell.mat')        %Saved good templates for use on bad movies
TemplateFitting_FromSCell;
Temp_PlotRandomTemplateMatchExamples

Kept=find(Dist100V<Cutoff & Dist100V>0);
NumKept=length(Kept);

FXYCMS_Kept={};
ind=1;
for i=1:NumKept
    I=Inds(Kept(i));
    FXYCMS_Kept{ind}=FXYCMS{I};
    ind=ind+1;
end

% for i=1:NumKept
%     I=Kept(i);
%     wind=start(I):finish(I);
%     ManINew{i}=ManI{I}(wind);
% end

% SCell3=MakeCohortAverageTraceCell(ManI3,2,'max');
% title('3s')
% SCellNew=MakeCohortAverageTraceCell(ManINew,2,'max');
% title('Template_Match')