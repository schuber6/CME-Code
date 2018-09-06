function ManualAnalysis(file,movie,varargin)
    
load(file)
[filepath,name] = fileparts(file);
filetst=strcat(filepath,'\',name(1:end-10),'ManualAnalysis.mat');
if exist(filetst)==0
    tracest=FXYCMS2Tracest(FXYCMS,varargin{:});
    save(filetst,'tracest')
end
figure_code_for_scott_StaticArea(movie,movie,filetst);