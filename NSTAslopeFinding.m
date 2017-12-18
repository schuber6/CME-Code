SlopeFrames=8;
ind=[];
FrameGap=3;

for i=1:SlopeFrames
    ind(i)=i*FrameGap;
end
h=waitbar(0,'Finding Slopes');
slopeZ=cell(2,4);
slopeINT=cell(2,4);
F=cell(2,4);
for i0=1:4
for Window=[1 2]
    index=1;
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
    waitbar(i/length(N))
    if N(i).class==0
        used=find(N(i).frame,100,'last');
        if N(i).frame(used(end))>=beg && N(i).frame(used(end))<fin
            medZ=median(N(i).st(used));
        for i2=1:length(used)
            AVtraceINTwin{Window}(1+length(used)-i2)=AVtraceINTwin{Window}(1+length(used)-i2)+N(i).int(used(i2))/max(N(i).int);
            AVtraceZwin{Window}(1+length(used)-i2)=AVtraceZwin{Window}(1+length(used)-i2)+N(i).st(used(i2))-medZ;
            Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
            if length(used)-i2>=SlopeFrames-1
            for i3=1:SlopeFrames
                Z(i3)=N(i).st(used(i2+i3-1));
                INT(i3)=N(i).int(used(i2+i3-1))/max(N(i).int);
            end
            [slopeZ{Window,i0}(index), ~]=LinearSlopeandR2(ind,Z);
            [slopeINT{Window,i0}(index), ~]=LinearSlopeandR2(ind,INT);
            F{Window,i0}(index)=1+length(used)-i2;
            index=index+1;
            end
            
        end
        CountsT=CountsT+1;
        end
    end
end
AVtraceINTwin{Window}=AVtraceINTwin{Window}/CountsT;
AVtraceZwin{Window}=AVtraceZwin{Window}/CountsT;
plot(AVtraceINTwin{Window},'b')
hold on
plot(AVtraceZwin{Window},'r')
xlabel('Frames from the end of the trace')
ylabel('Average Trace')
title('Z position (red), Intensity (blue)')
ylim([-.2 .8])
end
end
close(h)