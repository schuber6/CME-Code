function [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,Traces,Frame)
    
    MI=[];
    SI=[];
    for i=1:length(Traces)
        fxyc=FXYCMS{Traces(i)};
        if ismember(Frame,fxyc(:,1))
            ind=find(fxyc(:,1)==Frame);
            MI=[MI fxyc(ind,6)];
            SI=[SI fxyc(ind,7)];
        end
    end