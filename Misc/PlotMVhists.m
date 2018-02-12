function PlotMVhists(AMvLGc,AMvLGo)

xbins=1:44;
xbins=xbins/4;
for i=1:5
subplot(2,5,i)
hist(AMvLGc{i},xbins)
xlim([0 10])
title(strcat('Mean = ',num2str(mean(AMvLGc{i}))))
subplot(2,5,i+5)
hist(AMvLGo{i},xbins)
xlim([0 10])
title(strcat('Mean = ',num2str(mean(AMvLGo{i}))))
end
