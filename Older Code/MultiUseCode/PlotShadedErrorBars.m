function Obj=PlotShadedErrorBars(xs,Data,SDData,Cm,Cr)


%xs=1:length(Data);
ys(:,1)=Data-SDData;
ys(:,2)=2*SDData;


hold on


Obj=plot(xs,Data,'LineWidth',1,'Color',Cm);
hold on
h=area(xs,ys,'LineStyle','none');
h(1).FaceColor = 'none';
h(2).FaceAlpha = .25;
h(2).FaceColor=Cm;