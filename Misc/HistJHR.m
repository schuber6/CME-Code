start=200;
finish=250;
JOSHs=RestrictJOSHSlopes(JOSH0,JOSHF,start,finish);
hist(nonzeros(JOSHs),xbins)
V=hist(nonzeros(JOSHs),xbins);
V(1)=0;
V(length(V))=0;
ylim([0 max(V)*1.1])
xlim([-.2 .2])