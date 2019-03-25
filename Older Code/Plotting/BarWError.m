function BarWError(Y,E,varargin)

if length(varargin)==1
    X=varargin{1};
    bar(X,Y,'b')
    hold on
    errorbar(X,Y,E,'LineStyle','None')
else
    bar(Y,'b')
    hold on
    errorbar(Y,E,'LineStyle','None')
end