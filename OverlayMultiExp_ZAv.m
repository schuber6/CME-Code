
%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
%exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
exp_name='E:\CME Superfolder\CME Data\170512_SUM_JaspOsmo';
Group1=[1 2 5 6];
Group2=[3 4 7 8];
tmpd = dir(fullfile(exp_name,'*.mat'));
ZSpacing=400;
XYSpacing=160;
AW=25;
for i0=1:length(tmpd)
    
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    [~,~,~,NSTA]=CorrectForDrift(NSTA);
    %figure
    for W=1:2
        if W==1
            beg=1;
            fin=100;
            C=[0 1 0];
        else
            beg=150;
            fin=250;
            C=[1 0 0];
        end
    if ismember(i0,Group2)
        C=C+[0 0 1];
    end
    N=NSTA;
AVtraceINT=zeros(1,AW);
AVtraceZ=zeros(1,AW);
AVtraceZ0=zeros(1,AW);
AVtraceD=zeros(1,AW);
AVtraceZabs=zeros(1,AW);
AVtraceZabs0=zeros(1,AW);
AVtraceX=zeros(1,AW);
AVtraceY=zeros(1,AW);
AVtraceXabs=zeros(1,AW);
AVtraceYabs=zeros(1,AW);
Counts=zeros(1,AW);
CountsT=0;
Counts0=zeros(1,AW);
CountsT0=0;
for i=1:length(N)
    if N(i).class<4 && N(i).class~=1
        used=find(N(i).frame,AW,'last');
%         medZ=median(N(i).st(used)); %Use median position as origin
%         medX=median(N(i).xpos(used));
%         medY=median(N(i).ypos(used));
        medZ=(N(i).st(used(1))); %Use first timepoint as origin
        medX=(N(i).xpos(used(1)));
        medY=(N(i).ypos(used(1)));
        
        for i2=1:length(used)
            Frame=N(i).frame(used(i2));
            if Frame>=beg && Frame<fin
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
if W==1
    subplot(2,2,1)
    plot(AVtraceZ,'Color',C)
    hold on
    
    title('Average Value of Z Distance (Red: Post-Osmo, Green: Pre-Osmo)')
    subplot(2,2,2)
    plot(AVtraceZabs,'Color',C)
    hold on
else
    subplot(2,2,3)
    plot(AVtraceZ,'Color',C)
    hold on
    
    title('Average Value of Z Distance (Red: Post-Osmo, Green: Pre-Osmo)')
    subplot(2,2,4)
    plot(AVtraceZabs,'Color',C)
    hold on
end

%title('Z position (red), Intensity (blue), 3D Distance from first timepoint (green)')
    end
end