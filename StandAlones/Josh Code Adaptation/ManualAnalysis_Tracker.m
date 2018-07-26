function ManualAnalysis_Tracker(file,movie,subset,varargin)
    
load(file)
filetst='TST_Test.mat';
tracest=Tracker2Tracest(TraceX(subset,:),TraceY(subset,:),TraceINT(subset,:),varargin{:});
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movie,movie,filetst);