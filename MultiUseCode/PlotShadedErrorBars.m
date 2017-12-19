function PlotShadedErrorBars(xs,Data,SDData,Cm,Cr)


%xs=1:length(Data);
ys(:,1)=Data-SDData;
ys(:,2)=2*SDData;


hold on

h=area(xs,ys,'LineStyle','none');
plot(xs,Data,'LineWidth',2,'Color',Cm)
hold on
h(1).FaceColor = 'none';
%h(2).FaceAlpha = .99;
h(2).FaceColor=Cr;