function [IntCellM,IntCellS,varargout]=FXYCMS2IntCells(FXYCMS,Cs,varargin)
%Cs is the acceptible trace categories

NBins=100;

if length(varargin)>=1
    normalizeI=varargin{1};
    if length(varargin)>=2
        normalizeT=varargin{2};
    else
        normalizeT=0;
    end
else
    normalizeI=0;
    normalizeT=0;
end

IntCellM={};
IntCellS={};
Is=[];
    ind=1;
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        c=fxyc(1,4);
        if ismember(c,Cs)
            traceM=fxyc(:,6);
            traceS=fxyc(:,7);
            if normalizeT
                traceM=ScottifyTrace(traceM,NBins).';
                traceS=ScottifyTrace(traceS,NBins).';
            end
            if normalizeI
                IntCellM{ind}=(traceM-min(traceM))/(max(traceM)-min(traceM));
                IntCellS{ind}=(traceS-min(traceS))/(max(traceS)-min(traceS));
                Is(ind)=i;
                ind=ind+1;
            else
                IntCellM{ind}=traceM;
                IntCellS{ind}=traceS;
                Is(ind)=i;
                ind=ind+1;
            end
        end
    end
    varargout{1}=Is;