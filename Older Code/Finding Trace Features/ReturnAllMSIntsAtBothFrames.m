function [MI,SI]=ReturnAllMSIntsAtBothFrames(FXYCMS,Traces,Frames)
    
    MI=[];
    SI=[];
    for i=1:length(Traces)
        fxyc=FXYCMS{Traces(i)};
        if ismember(Frames(1),fxyc(:,1)) && ismember(Frames(2),fxyc(:,1))
            ind{1}=find(fxyc(:,1)==Frames(1));
            ind{2}=find(fxyc(:,1)==Frames(2));
            MI=[MI ; [fxyc(ind{1},6) fxyc(ind{2},6)]];
            SI=[SI ; [fxyc(ind{1},7) fxyc(ind{2},7)]];
        end
    end