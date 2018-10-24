function ManualConclusionAnalysis(file,movie,varargin)
    
load(file)
Tmast=0;
MinLTF=5;
FrameGap=2;
[filepath,name] = fileparts(file);
filetst=strcat(filepath,'\',name(1:end-10),'ManualConclusionAnalysis.mat');
fileFXYC=strcat(filepath,'\',name(1:end-10),'ManualConclusionAnalysis_FXYC.mat');
if exist(filetst)==0
    [~,~,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,Inf,0,2);
    tracest=FXYCMS2Tracest(FXYCMS_Sel,varargin{:});
    save(filetst,'tracest')
    save(fileFXYC,'FXYCMS_Sel')
end
figure_code_for_scott_StaticArea(movie,movie,filetst);