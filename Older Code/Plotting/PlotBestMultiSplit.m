function PlotBestMultiSplit(traces,Fs,Forig)


T=[];
for i=1:length(traces)
    Ls(i)=length(traces{i});
    T=[T traces{i}];
end
plot(T+50,':')
hold on
Leg{1}=num2str(Forig);
for i=1:length(traces)
    t=sum(Ls(1:(i-1)))+1:sum(Ls(1:(i-1)))+Ls(i);
    plot(t,traces{i})
    hold on
    Leg{i+1}=num2str(Fs(i));
end
legend(Leg)