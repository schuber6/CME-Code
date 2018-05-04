function [FXYCMS_Sel,varargout]=SelectLargeOnes(FXYCMS)
    

    FXYCMS_Sel={};
    LTs=[];
    MMs=[];
    MSs=[];
    ind=1;
    for i=1:length(FXYCMS)
        if length(FXYCMS{i}(:,1))>=100
            FXYCMS_Sel{ind}=FXYCMS{i};
            LTs=[LTs length(FXYCMS{i}(:,1))];
            MMs=[MMs max(FXYCMS{i}(:,6))];
            MSs=[MSs max(FXYCMS{i}(:,7))];
            ind=ind+1;
        end
    end
    varargout{1}=LTs;
    varargout{2}=MMs;
    varargout{3}=MSs;