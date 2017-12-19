NormA=XYAmAs(:,3)/median(XYAmAs(:,3));
NormS=XYAmAs(:,4)/median(XYAmAs(:,4));
NormM=XYAmAs(:,5)/median(XYAmAs(:,5));
NormR=XYAmAs(:,6)/median(XYAmAs(:,6));
% NormA=XYAmAs(:,3)/mean(XYAmAs(:,3));
% NormS=XYAmAs(:,4)/mean(XYAmAs(:,4));
% NormM=XYAmAs(:,5)/mean(XYAmAs(:,5));
% NormR=XYAmAs(:,6)/mean(XYAmAs(:,6));
% Ratio_MS=XYAmAs(:,3)./XYAmAs(:,4);
% Ratio_MM=XYAmAs(:,3)./XYAmAs(:,5);
% Ratio_MR=XYAmAs(:,3)./XYAmAs(:,6);
Ratio_MS=NormA./NormS;
Ratio_MM=NormA./NormM;
Ratio_MR=NormA./NormR;
xbins=1:50;
xbins=xbins/50*3;
HMS=hist(Ratio_MS,xbins);
HMM=hist(Ratio_MM,xbins);
HMR=hist(Ratio_MR,xbins);
SS=sqrt(var(Ratio_MS));
SM=sqrt(var(Ratio_MM));
SR=sqrt(var(Ratio_MR));
plot(xbins,HMS,'r')
hold on
plot(xbins,HMM,'g')
plot(xbins,HMR,'b')
legend('Master/Slave','Master/Master','Master/Randomized Slave')
