function PlotIntensityVSExposure(I,exposureCs)

figure
for i=1:length(I(1,:))
    subplot(4,4,i)
    x=exposureCs.';
    y=I(:,i);
    scatter(exposureCs,I(:,i))
    hold on
    XL=xlim;
    %fm=fit(x,I(:,i),'poly1');
    [slope, rsq]=FitLinearNoIntercept(x,y);
    Yline(1)=slope*XL(1);
    Yline(2)=slope*XL(2);
    line(XL,Yline)
    FourS=find(exposureCs==4000);
    Hundreds=find(exposureCs==100);
    ExtErr=(y(FourS)/40-y(Hundreds))/y(Hundreds);
    title(strcat('R^2= ', num2str(rsq),' Extraptolation Error= ', num2str(ExtErr*100),'%'))
    %plot(fm,x,I(:,i))
    
end