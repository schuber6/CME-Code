Max=20000;
xbins=1:55;
xbins=xbins*Max*1.1/55;
for i=1:5
subplot(3,5,i)
NormMed=median(AfterMSslopec1(:,4));
NormMean=mean(AfterMSslopec1(:,4));
NormMax=max(AfterMSslopec1(:,4));
SD=sqrt(var(AfterMSslopec1(:,4)));
NPlus=length(find(AMvLGc1{i}>=NormMean+SD));

hist(AMvLGc1{i},xbins)
xlim([0 Max])
YL=ylim;
XL=xlim;
text(mean(XL),mean(YL),num2str(NPlus/length(AMvLGc1{i})));
line([NormMed NormMed],YL,'Color','b')
line([NormMean NormMean],YL,'Color','g')
line([NormMean+SD NormMean+SD],YL,'Color','r')
end
for i=1:5
subplot(3,5,i+5)
NormMed=median(AfterMSslopec2(:,4));
NormMean=mean(AfterMSslopec2(:,4));
NormMax=max(AfterMSslopec2(:,4));
SD=sqrt(var(AfterMSslopec2(:,4)));
NPlus=length(find(AMvLGc2{i}>=NormMean+SD));
hist(AMvLGc2{i},xbins)
xlim([0 Max])
YL=ylim;
XL=xlim;
text(mean(XL),mean(YL),num2str(NPlus/length(AMvLGc2{i})));
line([NormMed NormMed],YL,'Color','b')
line([NormMean NormMean],YL,'Color','g')
line([NormMean+SD NormMean+SD],YL,'Color','r')
end
for i=1:5
subplot(3,5,i+10)
NormMed=median(AfterMSslopec3(:,4));
NormMean=mean(AfterMSslopec3(:,4));
NormMax=max(AfterMSslopec3(:,4));
SD=sqrt(var(AfterMSslopec3(:,4)));
NPlus=length(find(AMvLGc3{i}>=NormMean+SD));
hist(AMvLGc3{i},xbins)
xlim([0 Max])
YL=ylim;
XL=xlim;
text(mean(XL),mean(YL),num2str(NPlus/length(AMvLGc3{i})));
line([NormMed NormMed],YL,'Color','b')
line([NormMean NormMean],YL,'Color','g')
line([NormMean+SD NormMean+SD],YL,'Color','r')
end
subplot(3,5,1)
title('Fast Disolution')
subplot(3,5,2)
title('Slow Disolution')
subplot(3,5,3)
title('Constant Intensity')
subplot(3,5,4)
title('Slow Aggregation')
subplot(3,5,5)
title('Fast Aggregation')