function [MI,Fs,LTs,TraceFXY,TraceA]=FindGoodTraceMaxInts_FXYCMS(FXYCMS,MinLengthF,MaxLengthF)

MI=[];
Fs=[];
LTs=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    used=find(fxyc(:,1));
    if fxyc(1,4)==3 && length(used)>=MinLengthF && length(used)<=MaxLengthF %&& length(used)<=30
        MI=[MI max(fxyc(:,6))];
        ind=find(fxyc(:,6)==max(fxyc(:,6)));
        Fs=[Fs fxyc(ind(1),1)];
        LTs=[LTs length(used)];
        TraceFXY{length(LTs)}=[];
        TraceA{length(LTs)}=[];
        for i2=1:length(used)
            TraceFXY{length(LTs)}=[TraceFXY{length(LTs)} ; [fxyc(used(i2),1) fxyc(used(i2),2) fxyc(used(i2),3)]];
            TraceA{length(LTs)}=[TraceA{length(LTs)} fxyc(used(i2),5)];
        end
    end
end