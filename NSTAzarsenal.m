
%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
% exp_name='E:\CME Superfolder\CME Data\170616_Analysis';
%exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
exp_name='E:\CME Superfolder\CME Data\170628_NSTAs';
tmpd = dir(fullfile(exp_name,'*.mat'));
NF=30;
% fg=[0 .6 .4 2.5 2.5 .6 .4 2.5 2.5];
% zg=[0 100 200 200 200 100 200 200 200];
 %fg=[4 4 4 4 4 4 4 4 4];
 fg=[3 3 3 3 3 3 3 3 3];
 zg=[400 400 400 400 400 400 400 400];
for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    
    load(movies{i0});
    figure
    LinkedSlopesWrapper_GenBins(NSTA,fg(i0),zg(i0));
    figure
    N=NSTA;
AVtraceINT=zeros(1,NF);
AVtraceZ=zeros(1,NF);
Counts=zeros(1,NF);
CountsT=0;
for i=1:length(N)
    if N(i).class==0
        used=find(N(i).int>=1000,NF,'last');
        if ~isempty(used)
        medZ=median(N(i).st(used));
        for i2=1:length(used)
            AVtraceINT(1+length(used)-i2)=AVtraceINT(1+length(used)-i2)+N(i).int(used(i2))/max(N(i).int);
            AVtraceZ(1+length(used)-i2)=AVtraceZ(1+length(used)-i2)+N(i).st(used(i2))-medZ;
            Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
        end
        CountsT=CountsT+1;
        end
    end
end
AVtraceINTt=AVtraceINT/CountsT;
AVtraceZt=AVtraceZ/CountsT;
AVtraceINT=AVtraceINT./Counts;
AVtraceZ=AVtraceZ./Counts;
% plot(AVtraceINT,'b')
% hold on
% plot(AVtraceZ,'r')
% xlabel('Frames from the end of the trace')
% ylabel('Average Trace')
% title('Z position (red), Intensity (blue)')
% figure 
plot(AVtraceINTt,'b')
hold on
plot(AVtraceZt,'r')
xlabel('Frames from the end of the trace')
ylabel('Average Trace (Trace Ends Count as 0)')
title('Z position (red), Intensity (blue)')
end