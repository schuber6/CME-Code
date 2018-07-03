function Inds=FindFullMovieTraces(FXYCMS)

MF=MaxFrameFXYCMS(FXYCMS);
Inds=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if min(fxyc(:,1))==1 && max(fxyc(:,1))==MF
        Inds=[Inds i];
    end
end