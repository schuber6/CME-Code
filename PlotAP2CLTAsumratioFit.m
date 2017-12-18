figure('units','normalized','outerposition',[0 0 1 1])
scatter(MS,SS,'filled')
hold on
xlabel('AP2 Sum Intensity')
ylabel('CLTA Sum Intensity')
[slopes, intercepts, rsqs]=LinearSlopeInterceptandR2(MS,SS);
x0=0;
x1=max(MS);
y0=intercepts;
y1=slopes*x1+intercepts;
line([x0 x1],[y0 y1],'Color','g')
legend('Data',strcat('CLTA=AP2*',num2str(slopes),'+',num2str(intercepts)))
ylim([min(SS) y1])