function NSTAavTraces_XYZ_F(NSTA)
%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
tmpd = dir(fullfile(exp_name,'*.mat'));
ZSpacing=400;
XYSpacing=160;
%for i0=1:1
    %movies{i0} = fullfile(exp_name,tmpd(i0).name);
    %load(movies{i0});
    figure
    N=NSTA;
AVtraceINT=zeros(1,100);
AVtraceZ=zeros(1,100);
AVtraceD=zeros(1,100);
AVtraceZabs=zeros(1,100);
AVtraceX=zeros(1,100);
AVtraceY=zeros(1,100);
AVtraceXabs=zeros(1,100);
AVtraceYabs=zeros(1,100);
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
            AVtraceX(1+length(used)-i2)=AVtraceX(1+length(used)-i2)+(N(i).xpos(used(i2))-medX)*XYSpacing;
            AVtraceY(1+length(used)-i2)=AVtraceY(1+length(used)-i2)+(N(i).ypos(used(i2))-medY)*XYSpacing;
            AVtraceXabs(1+length(used)-i2)=AVtraceXabs(1+length(used)-i2)+abs(N(i).xpos(used(i2))-medX)*XYSpacing;
            AVtraceYabs(1+length(used)-i2)=AVtraceYabs(1+length(used)-i2)+abs(N(i).ypos(used(i2))-medY)*XYSpacing;
            Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
        end
        CountsT=CountsT+1;
    end
end
AVtraceINTt=AVtraceINT/CountsT;
AVtraceZt=AVtraceZ/CountsT;
AVtraceZabst=AVtraceZabs/CountsT;
AVtraceXt=AVtraceX/CountsT;
AVtraceXabst=AVtraceXabs/CountsT;
AVtraceYt=AVtraceY/CountsT;
AVtraceYabst=AVtraceYabs/CountsT;
AVtraceDt=AVtraceD/CountsT;
AVtraceINT=AVtraceINT./Counts;
AVtraceZ=AVtraceZ./Counts;
AVtraceZabs=AVtraceZabs./Counts;
AVtraceX=AVtraceX./Counts;
AVtraceXabs=AVtraceXabs./Counts;
AVtraceY=AVtraceY./Counts;
AVtraceYabs=AVtraceYabs./Counts;
% plot(AVtraceINT,'b')
% hold on
% plot(AVtraceZ,'r')
% xlabel('Frames from the end of the trace')
% ylabel('Average Trace')
% title('Z position (red), Intensity (blue)')
% figure 

subplot(3,2,1)
plot(AVtraceZ,'r')
title('Average Value of Z Distance')
subplot(3,2,2)
plot(AVtraceZabs,'r')
title('Average Absolute Value of Z Distance')
subplot(3,2,3)
plot(AVtraceX,'r')
title('Average Value of X Distance')
subplot(3,2,4)
plot(AVtraceXabs,'r')
title('Average Absolute Value of X Distance')
subplot(3,2,5)
plot(AVtraceY,'r')
title('Average Value of Y Distance')
subplot(3,2,6)
plot(AVtraceYabs,'r')
title('Average Absolute Value of Y Distance')

xlabel('Frames from the end of the trace')
ylabel('Average Trace (Trace ends not included in average)')
%title('Z position (red), Intensity (blue), 3D Distance from first timepoint (green)')
%end