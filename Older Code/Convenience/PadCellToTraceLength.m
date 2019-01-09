function MsqE_Traces_Pad=PadCellToTraceLength(FXYCMS, MsqE_Traces)
    
    for i=1:length(FXYCMS)
        D=length(FXYCMS{i}(:,1))-length(MsqE_Traces{i}(:));
        if D>0
            MsqE_Traces{i}=[MsqE_Traces{i} zeros(1,D)];
        end
    end
    MsqE_Traces_Pad=MsqE_Traces;