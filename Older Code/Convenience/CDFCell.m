function CDFCell(C,bins,varargin)
%varargin can optionally hold color rgb values for the plot

for i=1:length(C)
    if i==1
        [H{i},xbins]=hist(C{i},bins);
    else
        [H{i},xbins]=hist(C{i},xbins);
    end
    for i2=1:length(H{i})
        CDF{i}(i2)=sum(H{i}(1:i2))/sum(H{i});
    end
    if length(varargin)==0
        plot(xbins,CDF{i},'LineWidth',4)
        hold on
    else
        Cols=varargin{1};
        plot(xbins,CDF{i},Cols{i},'LineWidth',4)
        hold on
    end
end