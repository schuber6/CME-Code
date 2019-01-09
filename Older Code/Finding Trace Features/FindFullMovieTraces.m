function Inds=FindFullMovieTraces(FXYCMS,varargin)

if nargin==1
    MF=MaxFrameFXYCMS(FXYCMS);
else 
    MF=varargin{1};
end
Inds=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if length(fxyc(:,1))>=MF
        Inds=[Inds i];
    end
end