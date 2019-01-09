function varargout=CDF_PrctileLines(CDFx,CDFy,PRCs,varargin)
%Puts dashed lines in CDF to denote the given pctiles of the data

if length(varargin)>0
    plt=varargin{1};
else
    plt=1;
end

XL=xlim;
YL=ylim;
xq=0:max(CDFx)/1000:max(CDFx);
yq=interp1(CDFx,CDFy,xq);
for i=1:length(PRCs)
    xi=find(yq>=PRCs(i),1,'first');
    x=xq(xi(1));
    if plt
        line([0 x],[PRCs(i) PRCs(i)],'LineStyle','--','Color','k')
        line([x x],[0 PRCs(i)],'LineStyle','--','Color','k')
    end
    Xs(i)=x;
end
varargout{1}=Xs;