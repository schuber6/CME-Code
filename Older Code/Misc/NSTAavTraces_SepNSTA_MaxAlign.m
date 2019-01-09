
exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
tmpd = dir(fullfile(exp_name,'*.mat'));

for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    figure
    N=NSTA;
AVtraceINT=zeros(1,100);
AVtraceZ=zeros(1,100);
Counts=zeros(1,100);
CountsT=0;
for i=1:length(N)
    if N(i).class==0
        used=find(N(i).frame,100,'first');
        medZ=median(N(i).st(used));
        Max=find(N(i).int==max(N(i).int),1,'first');
        for i2=1:length(used)
            if i2-Max+50>0 && i2-Max+50<=100
            AVtraceINT(i2-Max+50)=AVtraceINT(i2-Max+50)+N(i).int(used(i2))/max(N(i).int);
            AVtraceZ(i2-Max+50)=AVtraceZ(i2-Max+50)+N(i).st(used(i2))-medZ;
            Counts(i2-Max+50)=Counts(i2-Max+50)+1;
            end
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