function [Inits,Concs]=InitiationConclusionIndices_FXYCMS(FXYCMS)
    

MF=MaxFrameFXYCMS(FXYCMS);
Inits=cell(1,MF);
Concs=cell(1,MF);
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    L=length(fxyc(:,1));
    if ismember(fxyc(1,4),[1 3 5]) && L>=10
        first=min(fxyc(:,1));
        Inits{first}=[Inits{first} i];
    end
    if ismember(fxyc(1,4),[2 3 6]) && L>=10
        last=max(fxyc(:,1));
        Concs{last}=[Concs{last} i];
    end
end