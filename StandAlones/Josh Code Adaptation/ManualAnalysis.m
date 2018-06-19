function ManualAnalysis(file,movie,varargin)
    
load(file)
filetst='TST_Test.mat';
tracest=FXYCMS2Tracest(FXYCMS,varargin{:});
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movie,movie,filetst);