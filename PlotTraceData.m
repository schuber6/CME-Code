function PlotTraceData(NSTA,trace)

subplot(2,2,3)
plot(NSTA(trace).frame,NSTA(trace).xpos)
subplot(2,2,4)
plot(NSTA(trace).frame,NSTA(trace).ypos)
title(strcat('Trace # ',num2str(trace),', Class ',num2str(NSTA(trace).class)))
subplot(2,2,1)

plot(NSTA(trace).frame,NSTA(trace).int)
title('Intensity')
subplot(2,2,2)

plot(NSTA(trace).frame,NSTA(trace).st)
title('Z-Pos')