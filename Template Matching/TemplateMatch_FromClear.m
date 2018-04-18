clear all
Cutoff=12;
Make_SCell_FromClear_FXYCMS;
load('AP2_SCell.mat')        %Saved good templates for use on bad movies
TemplateFitting_FromSCell;
Temp_PlotRandomTemplateMatchExamples

% for i=1:NumKept
%     I=Kept(i);
%     wind=start(I):finish(I);
%     ManINew{i}=ManI{I}(wind);
% end

% SCell3=MakeCohortAverageTraceCell(ManI3,2,'max');
% title('3s')
% SCellNew=MakeCohortAverageTraceCell(ManINew,2,'max');
% title('Template_Match')