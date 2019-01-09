function PlotCellTraces(TCell,TF,FG)

for i=1:length(TCell)
    for i2=1:length(TCell{i})
        t=((1:length(TCell{i}{i2}))-TF{i}(i2))*FG;
        plot(t,TCell{i}{i2},'r')
        hold on
    end
end