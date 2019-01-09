[A,~]=size(XYAmAs);
Ratios=XYAmAs(:,3)./XYAmAs(:,4);
xbins=1:50;
xbins=xbins/50*3;
hist(Ratios,xbins)
xlim([0 3])
mean(Ratios)
median(Ratios)
sqrt(var(Ratios))