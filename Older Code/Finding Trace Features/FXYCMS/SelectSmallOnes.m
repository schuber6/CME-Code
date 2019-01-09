function [FXYCMS_Sel,varargout]=SelectSmallOnes(FXYCMS,varargin)
    
    switch nargin
        case 2
            MinLT=varargin{1};
            Range=[];
        case 3
            MinLT=varargin{1};
            Range=varargin{2};
        otherwise
            MinLT=10;
            Range=[];
    end
    FXYCMS_Sel={};
    LTs=[];
    MMs=[];
    MSs=[];
    ind=1;
    for i=1:length(FXYCMS)
        if length(FXYCMS{i}(:,1))<100 && FXYCMS{i}(1,4)==3 && length(FXYCMS{i}(:,1))>=MinLT && (isempty(Range) || min(ismember(FXYCMS{i}(:,1),Range))==1)
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