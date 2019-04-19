function TraceInspection_TIRF_SIM(trace,movieSIM,movieTIRF,tit)

if isstruct(trace)
    t(:,1)=trace.frame;
    t(:,2)=trace.xpos;
    t(:,3)=trace.ypos;
    t(:,5)=trace.int;
else
    t=trace;
end
figure
subplot(3,1,3)
plot(t(:,1),t(:,5))
hold on
ylabel('Intensity')
xlabel('Frame')

ScaleSIM = MakeTraceQuilt(movieSIM,t);
ScaleTIRF = MakeTraceQuilt(movieTIRF,t);

Z=zeros(size(ScaleTIRF));
subplot(3,1,1)
imshow(max(ScaleTIRF,Z))
title(tit)
subplot(3,1,2)
imshow(max(ScaleSIM,Z))
title(tit)

%Decision=0;