function [MI,Fs,LTs,TraceFXY,TraceA]=FindGoodTraceMaxInts(fxyc,MinLengthF)

MI=[];
Fs=[];
LTs=[];
for i=1:length(fxyc(1,1,:))
    used=find(fxyc(:,1,i));
    if fxyc(1,4,i)==3 && length(used)>=MinLengthF %&& length(used)<=30
        MI=[MI max(fxyc(:,5,i))];
        ind=find(fxyc(:,5,i)==max(fxyc(:,5,i)));
        Fs=[Fs fxyc(ind(1),1,i)];
        LTs=[LTs length(used)];
        TraceFXY{length(LTs)}=[];
        TraceA{length(LTs)}=[];
        for i2=1:length(used)
            TraceFXY{length(LTs)}=[TraceFXY{length(LTs)} ; [fxyc(used(i2),1,i) fxyc(used(i2),2,i) fxyc(used(i2),3,i)]];
            TraceA{length(LTs)}=[TraceA{length(LTs)} fxyc(used(i2),5,i)];
        end
    end
end