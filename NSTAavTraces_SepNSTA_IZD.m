
%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
%exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
exp_name='E:\CME Superfolder\CME Data\170616_Analysis';
tmpd = dir(fullfile(exp_name,'*.mat'));
ZSpacing=400;
XYSpacing=160;
for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    figure
    N=NSTA;
AVtraceINT=zeros(1,100);
AVtraceZ=zeros(1,100);
AVtraceD=zeros(1,100);
AVtraceZabs=zeros(1,100);
Counts=zeros(1,100);
CountsT=0;
for i=1:length(N)
    if N(i).class==0
        used=find(N(i).frame,100,'last');
        medZ=median(N(i).st(used));
        medX=median(N(i).xpos(used));
        medY=median(N(i).ypos(used));
        for i2=1:length(used)
            AVtraceINT(1+length(used)-i2)=AVtraceINT(1+length(used)-i2)+N(i).int(used(i2));
            AVtraceZ(1+length(used)-i2)=AVtraceZ(1+length(used)-i2)+(N(i).st(used(i2))-medZ)*ZSpacing;
            AVtraceZabs(1+length(used)-i2)=AVtraceZabs(1+length(used)-i2)+abs(N(i).st(used(i2))-medZ)*ZSpacing;
            AVtraceD(1+length(used)-i2)=AVtraceD(1+length(used)-i2)+sqrt(((N(i).st(used(i2))-medZ)*ZSpacing)^2+((N(i).xpos(used(i2))-medX)*XYSpacing)^2+((N(i).ypos(used(i2))-medY)*XYSpacing)^2);
            Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
        end
        CountsT=CountsT+1;
    end
end
AVtraceINTt=AVtraceINT/CountsT;
AVtraceZt=AVtraceZ/CountsT;
AVtraceZabst=AVtraceZabs/CountsT;
AVtraceDt=AVtraceD/CountsT;
AVtraceINT=AVtraceINT./Counts;
AVtraceZ=AVtraceZ./Counts;
% plot(AVtraceINT,'b')
% hold on
% plot(AVtraceZ,'r')
% xlabel('Frames from the end of the trace')
% ylabel('Average Trace')
% title('Z position (red), Intensity (blue)')
% figure 
subplot(1,4,1)
plot(AVtraceINTt,'b')
hold on
subplot(1,4,2)
plot(AVtraceZt,'r')
title('Average Value of Z Distance')
subplot(1,4,3)
plot(AVtraceZabst,'r')
title('Average Absolute Value of Z Distance')
subplot(1,4,4)
plot(AVtraceDt,'g')
xlabel('Frames from the end of the trace')
ylabel('Average Trace (Trace Ends Count as 0)')
title('Z position (red), Intensity (blue), 3D Distance from first timepoint (green)')
end