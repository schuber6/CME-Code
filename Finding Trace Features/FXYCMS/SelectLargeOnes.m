function [FXYCMS_Sel,varargout]=SelectLargeOnes(FXYCMS,varargin)
    
    if nargin==1
        MaxFrame=MaxFrameFXYCMS(FXYCMS);
    else
        MaxFrame=varargin{1};
    end
    FXYCMS_Sel={};
    LTs=[];
    MMs=[];
    MSs=[];
    ind=1;
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        L=length(find(fxyc(:,1)<=MaxFrame));
        if L>=100
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