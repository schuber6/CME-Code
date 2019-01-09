
%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
tmpd = dir(fullfile(exp_name,'*.mat'));
ZSpacing=400;
XYSpacing=160;
for i0=1:length(tmpd)
    
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    [~,~,~,NSTA]=CorrectForDrift(NSTA);
    
    figure
    N=NSTA;
AVtraceINT=zeros(1,100);
AVtraceZ=zeros(1,100);
AVtraceZ0=zeros(1,100);
AVtraceD=zeros(1,100);
AVtraceZabs=zeros(1,100);
AVtraceZabs0=zeros(1,100);
AVtraceX=zeros(1,100);
AVtraceY=zeros(1,100);
AVtraceXabs=zeros(1,100);
AVtraceYabs=zeros(1,100);
Counts=zeros(1,100);
CountsT=0;
Counts0=zeros(1,100);
CountsT0=0;
for i=1:length(N)
    if N(i).class<4
        used=find(N(i).frame,100,'last');
%         medZ=median(N(i).st(used)); %Use median position as origin
%         medX=median(N(i).xpos(used));
%         medY=median(N(i).ypos(used));
        medZ=(N(i).st(1)); %Use first timepoint as origin
        medX=(N(i).xpos(1));
        medY=(N(i).ypos(1));
        
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
            if N(i).class==0
                AVtraceZ0(1+length(used)-i2)=AVtraceZ0(1+length(used)-i2)+(N(i).st(used(i2))-medZ)*ZSpacing;
                AVtraceZabs0(1+length(used)-i2)=AVtraceZabs0(1+length(used)-i2)+abs(N(i).st(used(i2))-medZ)*ZSpacing;
                Counts0(1+length(used)-i2)=Counts0(1+length(used)-i2)+1;
            end
        end
        if N(i).class==0
            CountsT0=CountsT0+1;
        end
        CountsT=CountsT+1;
    end
end
AVtraceINTt=AVtraceINT/CountsT;
AVtraceZt=AVtraceZ/CountsT;
AVtraceZabst=AVtraceZabs/CountsT;
AVtraceZt0=AVtraceZ0/CountsT0;
AVtraceZabst0=AVtraceZabs0/CountsT0;
AVtraceXt=AVtraceX/CountsT;
AVtraceXabst=AVtraceXabs/CountsT;
AVtraceYt=AVtraceY/CountsT;
AVtraceYabst=AVtraceYabs/CountsT;
AVtraceDt=AVtraceD/CountsT;
AVtraceINT=AVtraceINT./Counts;
AVtraceZ=AVtraceZ./Counts;
AVtraceZabs=AVtraceZabs./Counts;
AVtraceZ0=AVtraceZ0./Counts0;
AVtraceZabs0=AVtraceZabs0./Counts0;
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
plot(AVtraceZt,'r')
hold on
plot(AVtraceZt0,'b')
title('Average Value of Z Distance (Red: 0-4, Blue: 0)')
subplot(3,2,2)
plot(AVtraceZabst,'r')
hold on
plot(AVtraceZabst0,'b')
title('Average Absolute Value of Z Distance (Red: 0-4, Blue: 0)')
subplot(3,2,3)
plot(AVtraceXt,'r')
title('Average Value of X Distance')
subplot(3,2,4)
plot(AVtraceXabst,'r')
title('Average Absolute Value of X Distance')
subplot(3,2,5)
plot(AVtraceYt,'r')
title('Average Value of Y Distance')
subplot(3,2,6)
plot(AVtraceYabst,'r')
title('Average Absolute Value of Y Distance')

xlabel('Frames from the end of the trace')
ylabel('Average Trace (Trace ends count as 0s in average)')
%title('Z position (red), Intensity (blue), 3D Distance from first timepoint (green)')
    
end