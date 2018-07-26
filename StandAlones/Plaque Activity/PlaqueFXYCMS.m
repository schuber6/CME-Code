function PlaqueFXYCMS(file,movieS,movieM,fileS)

load(file);

for i=1:length(TraceINT(:,1))
    MI(i)=min(TraceINT(i,:));
    SI(i)=sum(TraceINT(i,:));
    L(i)=length(nonzeros(TraceINT(i,:)));
end
SIp=ReversePrctile(SI,0:1:100);
subset=find(SIp>=90 & L>=75);
TraceX=TraceX(subset,:);
TraceY=TraceY(subset,:);
TraceINT=TraceINT(subset,:); %Pass only top 5% of traces by integrated intensity

fxyc=TraceINT2fxyc(TraceX,TraceY,TraceINT);
[FXYCMS]=GenerateMasterSlaveINTs_PixelSum(fxyc,movieS,0,movieM);
save(fileS,'FXYCMS')