function [Traces,MIO,SIO]=FindAllMidOsmoTraces(FXYCMS,OsmoF)
    %Returns indices of all traces that inclued frame OsmoF
    %As well as the master and slave intensity at OsmoF
    Traces=[];
    MIO=[];
    SIO=[];
    for i=1:length(FXYCMS)
        
        if ismember(OsmoF,FXYCMS{i}(:,1)) && max(FXYCMS{i}(:,6))>5000 && max(FXYCMS{i}(:,7))>5000
            fxyc=FXYCMS{i};
            Traces=[Traces i];
            oind=find(fxyc(:,1)==OsmoF);
            MIO=[MIO fxyc(oind,6)];
            SIO=[SIO fxyc(oind,7)];
        end
    end