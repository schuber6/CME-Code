function F=CompletingFraction(FXYCMS)
    
    %Counts fraction of spots that complete each frame
    MF=MaxFrameFXYCMS(FXYCMS);
    NC=zeros(1,MF);
    NT=zeros(1,MF);
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if fxyc(1,4)~=4
            NT(fxyc(:,1))=NT(fxyc(:,1))+1;
        end
        if ismember(fxyc(1,4),[2 3 6])
            NC(max(fxyc(:,1)))=NC(max(fxyc(:,1)))+1;
        end
    end
    F=NC./NT;
                