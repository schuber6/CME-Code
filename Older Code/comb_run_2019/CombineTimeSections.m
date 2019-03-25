function fxyc_struct_combined=CombineTimeSections(paths,SectionLengths)

load(fullfile(fileparts(paths{1}),'TempTraces.mat'))
fxyc_struct_combined=fxyc_struct;
for i=2:length(paths)
    load(fullfile(fileparts(paths{i}),'TempTraces.mat'))
    fxycS=fxyc_struct;
    LF=sum(SectionLengths(1:i-1))-(i-2);  %Last potential frame of traces in fxyc_struct_combined
    fxyc_struct_combined=CombineTraceStructs(fxyc_struct_combined,fxycS,LF);
end