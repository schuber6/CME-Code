function [p,FPp]=QuantifyDoubleTrackingAccuracy(FXYCMS1,FXYCMS2,Matches)

inds=[];
for i=1:length(FXYCMS1)
    if FXYCMS1{i}(1,4)==3
        inds=[inds i];
    end
end


for i=1:length(inds)
    T1=inds(i);
    Mi=find(Matches(:,1)==T1);
    if ~isempty(Mi)
        T2=Matches(Mi,2);
        fxyc1=FXYCMS1{T1};
        fxyc2=FXYCMS2{T2};
        [p(i),FPp(i)]=PercentMatch(fxyc1,fxyc2);
    else
        p(i)=0;
        FPp(i)=1;
    end
end
