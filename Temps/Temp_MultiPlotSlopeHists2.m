exp_name='E:\CME Superfolder\CME Data\170512_SUM_JaspOsmo';
tmpd = dir(fullfile(exp_name,'*.mat'));

xbins=-50:50;
xbins=xbins*.1/50;
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
    Slopes{i0,Window}=FindSlopesinRange(NSTA,beg,fin);
    
end
subplot(2,4,i0)



for Window=1:floor(M/WindowSize)
SD(i0,Window)=sqrt(var(Slopes{i0,Window}));
H=hist(Slopes{i0,Window},xbins);
plot(xbins,H/sum(H))
hold on

end


end
close(h)