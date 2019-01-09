for i0=1:4
for Window=[1 2]
    if i0~=4 && Window==2
        W2=4;
    else
        W2=Window;
    end
    beg=(W2-1)*100;
    fin=W2*100;
%i0=1;
    figure
    N=nsta{i0};
AVtraceINTwin{Window}=zeros(1,100);
AVtraceZwin{Window}=zeros(1,100);
Counts=zeros(1,100);
CountsT=0;
for i=1:length(N)
    if N(i).class==0
        used=find(N(i).frame,100,'last');
        if N(i).frame(used(end))>=beg && N(i).frame(used(end))<fin
            medZ=median(N(i).st(used));
        for i2=1:length(used)
            AVtraceINTwin{Window}(1+length(used)-i2)=AVtraceINTwin{Window}(1+length(used)-i2)+N(i).int(used(i2))/max(N(i).int);
            AVtraceZwin{Window}(1+length(used)-i2)=AVtraceZwin{Window}(1+length(used)-i2)+N(i).st(used(i2))-medZ;
            Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
        end
        CountsT=CountsT+1;
        end
    end
end
AVtraceINTwin{Window}=AVtraceINTwin{Window}/CountsT;
AVtraceZwin{Window}=AVtraceZwin{Window}/CountsT;
AVtraceINTwinT{Window,i0}=AVtraceINTwin{Window};
AVtraceZwinT{Window,i0}=AVtraceZwin{Window};
plot(AVtraceINTwin{Window},'b')
hold on
plot(AVtraceZwin{Window},'r')
xlabel('Frames from the end of the trace')
ylabel('Average Trace')
title('Z position (red), Intensity (blue)')
ylim([-.2 .8])
end
end