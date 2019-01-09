clear ST
figure
inds=[1 5 6 8 10 11 13 14 19 22];
for i=1:10
    subplot(5,10,i)
    t=(1:length(FXYC_WT{inds(i)}(:,6)))*3;
    traceM=FXYC_WT{inds(i)}(:,6);
    ST{i}=ScottifyTrace(traceM,100);
    %plot(FXYC_WT{inds(i)}(:,6))
    plot(ST{i})
    xlabel('% of Trace')
    ylabel('Intensity')
end
FXYC_TOT=FXYC_WT(inds);
for i=[1 2 4 5 6 8 9 10]
    subplot(5,10,i+20)
    plot(ST{i})
    xlabel('% of Trace')
    ylabel('Intensity')
end
subplot(5,10,23)
plot((ST{3}+ST{7})/2)
for i=[1 4 5 8 9 10]
    subplot(5,10,i+40)
    plot(ST{i})
    xlabel('% of Trace')
    ylabel('Intensity')
end
subplot(5,10,43)
plot((ST{3}+ST{7})/2)
subplot(5,10,42)
plot((ST{2}+ST{6})/2)

Clusts=8;
FrameGap=3;
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYC_TOT,3,1,1);
[clusters] = createTraceLibrary_Temp(IntCellM,FrameGap,Clusts,1,0,1);

%%

clear ST t
figure
inds=[1 5 6 8 10 11 13 14 19 22];
for i=1:10
    subplot(5,10,i)
    t{i}=(1:length(FXYC_WT{inds(i)}(:,6)))*3;
    traceM=FXYC_WT{inds(i)}(:,6);
    ST{i}=traceM;
    %plot(FXYC_WT{inds(i)}(:,6))
    plot(t{i},ST{i})
    xlabel('Time (s)')
    ylabel('Intensity')
end
FXYC_TOT=FXYC_WT(inds);
for i=[1 2 4 5 7 8 9 10]
    subplot(5,10,i+20)
    plot(ST{i})
    xlabel('Time (s)')
    ylabel('Intensity')
end
subplot(5,10,23)
ST{3}=AverageTraces(ST{3},ST{6});
t{3}=max(t{3},t{6});
plot(t{3},ST{3})
    xlabel('Time (s)')
    ylabel('Intensity')
for i=[1 2 4 5 7 9 10]
    subplot(5,10,i+40)
    plot(ST{i})
    xlabel('Time (s)')
    ylabel('Intensity')
end
subplot(5,10,43)
ST{3}=AverageTraces(ST{3},ST{8});
t{3}=max([t{3} 0 0 0],t{8});
plot(t{3},ST{3})
    xlabel('Time (s)')
    ylabel('Intensity')

Clusts=8;
FrameGap=3;
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYC_TOT,3,1,0);
[clusters] = createTraceLibrary_Temp(IntCellM,FrameGap,Clusts,1,0,1);