function TimeShift=CenterByPeak(Time,Int)

TimeShift=cell(1,length(Time));
for i=1:length(Time)
    Peak=Time{i}(find(Int{i}==max(Int{i})));
    for i2=1:length(Time{i})
        TimeShift{i}(i2)=Time{i}(i2)-Peak;
    end
end