function Vp=ReversePrctile(V,varargin)
%User inputted pbins should start with 0

if nargin==1
    pbins=0:5:100;
else
    pbins=varargin{1};
end

for i=1:length(pbins)
    pV(i)=prctile(V,pbins(i));
end

for i=1:length(V)
    B=find(pV<=V(i),1,'last');
    Vp(i)=pbins(B);
end