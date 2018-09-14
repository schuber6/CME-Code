function [MS,Nc,LT,FXYCMS_Good]=ManualConclusionAnalysis_Results(file)
    
% load(file)
% Tmast=0;
% MinLTF=5;
% FrameGap=2;
[filepath,name] = fileparts(file);
filetst=strcat(filepath,'\',name(1:end-10),'ManualConclusionAnalysis.mat');
fileFXYC=strcat(filepath,'\',name(1:end-10),'ManualConclusionAnalysis_FXYC.mat');
% if exist(filetst)==0
%     [~,~,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
%     tracest=FXYCMS2Tracest(FXYCMS_Sel,varargin{:});
%     save(filetst,'tracest')
%     save(fileFXYC,'FXYCMS_Sel')
% end
% figure_code_for_scott_StaticArea(movie,movie,filetst);
MS=[];
LT=[];
Nc=-1;
FXYCMS_Good={};
ind=1;
indlt=1;
if exist(filetst)~=0
    load(filetst)
    load(file)
    if sum([tracest.ishot])+sum([tracest.ispair])>=5
        Nc=0;
        load(fileFXYC)
        for i=1:length(FXYCMS_Sel)
            if tracest(i).ishot
                Nc=Nc+1;
                FXYCMS_Good{ind}=FXYCMS_Sel{i};
                MS(ind)=max(FXYCMS_Sel{i}(:,7));
                
                [Fi,Ti]=FindTrace(FXYCMS,FXYCMS_Sel{i}(1,1),FXYCMS_Sel{i}(1,2),FXYCMS_Sel{i}(1,3));
                if FXYCMS{Fi}(1,4)==1 || FXYCMS{Fi}(1,4)==3
                    LT(indlt)=length(FXYCMS{Fi}(:,1));
                    indlt=indlt+1;
                end
                ind=ind+1;
            end
        end
    end
end
