function ManualAnalysis_FXYCMS_Traces(FXYCMS,traces,movie,varargin)
    
for i=1:length(traces)
    FXYCMS_Sel{i}=FXYCMS{traces(i)};
end
filetst='TST_Test.mat';
tracest=FXYCMS2Tracest(FXYCMS_Sel,varargin{:});
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movie,movie,filetst);