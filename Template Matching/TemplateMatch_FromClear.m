clear all
Make_SCell_FromClear;
TemplateFitting_FromSCell;
Temp_PlotRandomTemplateMatchExamples

for i=1:NumKept
    I=Kept(i);
    wind=start(I):finish(I);
    ManINew{i}=ManI{I}(wind);
end

SCell3=MakeCohortAverageTraceCell(ManI3,2,'max');
title('3s')
SCellNew=MakeCohortAverageTraceCell(ManINew,2,'max');
title('Template_Match')