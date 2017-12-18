figure
scatter(MI,SI)
hold on
xlabel('AP2 Intensity')
ylabel('CLTA Intensity')
[slope, intercept, rsq]=LinearSlopeInterceptandR2(MI,SI);
x0=0;
x1=5000;
y0=intercept;
y1=slope*x1+intercept;
line([x0 x1],[y0 y1],'Color','g')
legend('Data',strcat('CLTA=AP2*',num2str(slope),'+',num2str(intercept)))
ylim([0 y1])