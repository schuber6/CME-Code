MP=M(4:20);
AP2P=AP2(4:20);
scatter(AP2P,MP)
hold on
[slope, intercept, rsq]=LinearSlopeInterceptandR2(AP2P,MP);
x0=0;
x1=5000;
y0=intercept;
y1=slope*x1+intercept;
line([x0 x1],[y0 y1],'Color','g')
legend('Data',strcat('CLTA=AP2*',num2str(slope),'+',num2str(intercept)))
xlabel('AP2 Intensity')
ylabel('CLTA Intensity')