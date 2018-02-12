Max=30000;
xbins=1:55;
xbins=xbins*Max*1.1/55;
for i=1:5
subplot(4,5,i)
NormMed=median(AfterMSslopeo1(:,4));
NormMean=mean(AfterMSslopeo1(:,4));
NormMax=max(AfterMSslopeo1(:,4));
hist(AMvLGo1{i},xbins)
SD=sqrt(var(AfterMSslopeo1(:,4)));
NPlus=length(find(AMvLGo1{i}>=NormMean+SD));
xlim([0 Max])
YL=ylim;
XL=xlim;
text(mean(XL),mean(YL),num2str(NPlus/length(AMvLGo1{i})));
line([NormMed NormMed],YL,'Color','b')
line([NormMean NormMean],YL,'Color','g')
line([NormMean+SD NormMean+SD],YL,'Color','r')
end
for i=1:5
subplot(4,5,i+5)
NormMed=median(AfterMSslopeo2(:,4));
NormMean=mean(AfterMSslopeo2(:,4));
NormMax=max(AfterMSslopeo2(:,4));
hist(AMvLGo2{i},xbins)
SD=sqrt(var(AfterMSslopeo2(:,4)));
NPlus=length(find(AMvLGo2{i}>=NormMean+SD));
xlim([0 Max])
YL=ylim;
XL=xlim;
text(mean(XL),mean(YL),num2str(NPlus/length(AMvLGo2{i})));
line([NormMed NormMed],YL,'Color','b')
line([NormMean NormMean],YL,'Color','g')
line([NormMean+SD NormMean+SD],YL,'Color','r')
end
for i=1:5
subplot(4,5,i+10)
NormMed=median(AfterMSslopeo3(:,4));
NormMean=mean(AfterMSslopeo3(:,4));
NormMax=max(AfterMSslopeo3(:,4));
hist(AMvLGo3{i},xbins)
SD=sqrt(var(AfterMSslopeo3(:,4)));
NPlus=length(find(AMvLGo3{i}>=NormMean+SD));
xlim([0 Max])
YL=ylim;
XL=xlim;
text(mean(XL),mean(YL),num2str(NPlus/length(AMvLGo3{i})));
line([NormMed NormMed],YL,'Color','b')
line([NormMean NormMean],YL,'Color','g')
line([NormMean+SD NormMean+SD],YL,'Color','r')
end
for i=1:5
subplot(4,5,i+15)
NormMed=median(AfterMSslopeo4(:,4));
NormMean=mean(AfterMSslopeo4(:,4));
NormMax=max(AfterMSslopeo4(:,4));
hist(AMvLGo4{i},xbins)
SD=sqrt(var(AfterMSslopeo4(:,4)));
NPlus=length(find(AMvLGo4{i}>=NormMean+SD));
xlim([0 Max])
YL=ylim;
XL=xlim;
text(mean(XL),mean(YL),num2str(NPlus/length(AMvLGo4{i})));
line([NormMed NormMed],YL,'Color','b')
line([NormMean NormMean],YL,'Color','g')
line([NormMean+SD NormMean+SD],YL,'Color','r')
end
subplot(4,5,1)
title('Fast Disolution')
subplot(4,5,2)
title('Slow Disolution')
subplot(4,5,3)
title('Constant Intensity')
subplot(4,5,4)
title('Slow Aggregation')
subplot(4,5,5)
title('Fast Aggregation')