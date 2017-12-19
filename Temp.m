clear cm
for i=1:length(fs)
    cm(i,:)=FitSlave5_faster_med(fs(i),round(xs(i)),round(ys(i)),file);
end