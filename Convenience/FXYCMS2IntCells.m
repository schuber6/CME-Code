function [IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,Cs)
%Cs is the acceptible trace categories

IntCellM={};
IntCellS={};
    ind=1;
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        c=fxyc(1,4);
        if ismember(c,Cs)
            IntCellM{ind}=fxyc(:,6);
            IntCellS{ind}=fxyc(:,7);
            ind=ind+1;
        end
    end