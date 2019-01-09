function LTG=LifetimeGroups(Areas,LTs,Stalls,inds)
nLTF=zeros(1,3);
for i=1:length(inds)
    nLTF(1)=nLTF(1)+length(find(LTs{inds(i)}<=24));
    nLTF(2)=nLTF(2)+length(find(LTs{inds(i)}>24 & LTs{inds(i)}<=150));
    nLTF(3)=nLTF(3)+length(find(LTs{inds(i)}>150))+length(Stalls{inds(i)});
end
LTG=nLTF/sum(Areas);
end