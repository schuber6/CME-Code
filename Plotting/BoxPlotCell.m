function BoxPlotCell(C)

T=[];
G=[];
for i=1:length(C)
    T=[T C{i}];
    G=[G zeros(1,length(C{i}))+i];
end
boxplot(T,G)