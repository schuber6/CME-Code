function varargout=CDF_XLines(CDFx,CDFy,Xs)
%Puts dashed lines in CDF to denote the given pctiles of the data

XL=xlim;
YL=ylim;
xq=0:max(CDFx)/1000:max(CDFx);
yq=interp1(CDFx,CDFy,xq);
for i=1:length(Xs)
    yi=find(xq>=Xs(i),1,'first');
    y=yq(yi(1));
    line([0 Xs(i)],[y y],'LineStyle','--','Color','k')
    line([Xs(i) Xs(i)],[0 y],'LineStyle','--','Color','k')
    Ys(i)=y;
end
varargout{1}=Ys;