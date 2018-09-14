function HistCell(C,bins)

for i=1:length(C)
    if i==1
        [H{i},xbins]=hist(C{i},bins);
    else
        [H{i},xbins]=hist(C{i},xbins);
    end
    plot(xbins,H{i}/sum(H{i}))
    hold on
end