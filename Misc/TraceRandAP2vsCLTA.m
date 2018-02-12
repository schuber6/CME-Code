
PlotAP2CLTAsumratioFit;
for i=1:1000
M=max(Good(:,1));
Ls=[];
for i=1:M
    len=length(find(Good(:,1)==i));
    Ls=[Ls len];
end
used=find(Ls>=5);
t=used(ceil(rand*length(used)));
TraceAP2vsCLTA(fxyc_struct,Good,t);
end
