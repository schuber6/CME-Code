function PlotRandomZProfiles(NSTA)

used=find([NSTA.class]==0);
figure
for i=1:9
    subplot(3,3,i)
    T=ceil(rand*length(used));
    y=NSTA(used(T)).Profile;
    x=1:length(y);
    plot(x,y)
    hold on
   [A,x0,s]=FitAndPlotGaussian(x,y);
    
    
    title(strcat('(A,x0,s)=(',num2str(A),',',num2str(x0),',',num2str(s),')'))
end