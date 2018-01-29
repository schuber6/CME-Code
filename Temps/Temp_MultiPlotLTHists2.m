exp_name='E:\CME Superfolder\CME Data\170512_SUM_JaspOsmo';
tmpd = dir(fullfile(exp_name,'*.mat'));

xbins=1:100;
xbins=xbins*300/100;
WindowSize=100;
h=waitbar(0,'Analyzing Slope Windows');
for i0=1:length(tmpd)
    waitbar(i0/length(tmpd))
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    M=maxframeNSTA(NSTA);
    SPicy=ceil(sqrt(floor(M/WindowSize)));
    
for Window=1:floor(M/WindowSize)
    
    beg=(Window-1)*WindowSize;
    fin=Window*WindowSize;
    
    LTs{i0,Window}=FindLifetimesinRange_NotBefore(NSTA,beg,fin,3);
end
subplot(2,4,i0)



for Window=1:floor(M/WindowSize)
Mlt_NB(i0,Window)=sqrt(var(LTs{i0,Window}));
H=hist(LTs{i0,Window},xbins);
plot(xbins,H/sum(H))
hold on

end


end
close(h)