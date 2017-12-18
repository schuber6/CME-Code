for i0=1:4
    figure
    N=nsta{i0};
AVtraceINT=zeros(1,100);
AVtraceZ=zeros(1,100);
Counts=zeros(1,100);
CountsT=0;
for i=1:length(N)
    if N(i).class==0
        used=find(N(i).frame,100,'last');
        medZ=median(N(i).st(used));
        for i2=1:length(used)
            AVtraceINT(1+length(used)-i2)=AVtraceINT(1+length(used)-i2)+N(i).int(used(i2))/max(N(i).int);
            AVtraceZ(1+length(used)-i2)=AVtraceZ(1+length(used)-i2)+N(i).st(used(i2))-medZ;
            Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
        end
        CountsT=CountsT+1;
    end
end
AVtraceINTt=AVtraceINT/CountsT;
AVtraceZt=AVtraceZ/CountsT;
AVtraceINT=AVtraceINT./Counts;
AVtraceZ=AVtraceZ./Counts;
plot(AVtraceINT,'b')
hold on
plot(AVtraceZ,'r')
xlabel('Frames from the end of the trace')
ylabel('Average Trace')
title('Z position (red), Intensity (blue)')
figure 
plot(AVtraceINTt,'b')
hold on
plot(AVtraceZt,'r')
xlabel('Frames from the end of the trace')
ylabel('Average Trace (Trace Ends Count as 0)')
title('Z position (red), Intensity (blue)')
end