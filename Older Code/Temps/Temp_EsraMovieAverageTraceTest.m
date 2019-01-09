clear all
NF=30;
IntCutoff=400;
% fg=[0 .6 .4 2.5 2.5 .6 .4 2.5 2.5];
% zg=[0 100 200 200 200 100 200 200 200];
 fg=[3 3 3 3 3 3 3 3];
 zg=[300 300 300 300 300 300 300 300]*4/3;
 movies{1}='E:\CME Superfolder\CME Data\Esra Movies 2\EsraMovies_0323_001.mat';
 movies{2}='E:\CME Superfolder\CME Data\Esra Movies 2\EsraMovies_0323_002.mat';
 movies{3}='E:\CME Superfolder\CME Data\Esra Movies 2\EsraMovies_0323_003.mat';
 movies{4}='E:\CME Superfolder\CME Data\Esra Movies 2\EsraMovies_0323_004.mat';
%  movies{1}='E:\CME Superfolder\CME Data\Esra Movies 2\EsraMovies_0323_001.mat';
%  movies{1}='E:\CME Superfolder\CME Data\Esra Movies 2\EsraMovies_0323_001.mat';
%  movies{1}='E:\CME Superfolder\CME Data\Esra Movies 2\EsraMovies_0323_001.mat';
%  movies{1}='E:\CME Superfolder\CME Data\Esra Movies 2\EsraMovies_0323_001.mat';
 AVtraceINTC=cell(1,NF);
AVtraceZC=cell(1,NF);
AVtraceLifeactC=cell(1,NF);
for i0=1:length(movies)
    
    
    load(movies{i0});    
figure
    N=NSTA;
AVtraceINT=zeros(1,NF);
AVtraceZ=zeros(1,NF);
AVtraceLifeact=zeros(1,NF);

Counts=zeros(1,NF);
CountsT=0;
for i=1:length(N)
    if N(i).class==0
        used=find(N(i).int>=IntCutoff,NF,'last');
        if length(used)>=7 %~isempty(used)
        medZ=median(N(i).st(used));
        %medZ=min(N(i).st(used));
        for i2=1:length(used)
            AVtraceINT(1+length(used)-i2)=AVtraceINT(1+length(used)-i2)+N(i).int(used(i2))/max(N(i).int);
            AVtraceZ(1+length(used)-i2)=AVtraceZ(1+length(used)-i2)+(N(i).st(used(i2))-medZ)*zg(i0);
            %AVtraceLifeact(1+length(used)-i2)=AVtraceLifeact(1+length(used)-i2)+N(i).Slave5x5(used(i2))/25-(N(i).Slave7x7(used(i2))-N(i).Slave5x5(used(i2)))/(49-25);
            AVtraceINTC{1+length(used)-i2}=[AVtraceINTC{1+length(used)-i2} N(i).int(used(i2))/max(N(i).int)];
            AVtraceZC{1+length(used)-i2}=[AVtraceZC{1+length(used)-i2} (N(i).st(used(i2))-medZ)*zg(i0)];
            %AVtraceLifeactC{1+length(used)-i2}=[AVtraceLifeactC{1+length(used)-i2} N(i).Slave5x5(used(i2))/25-(N(i).Slave7x7(used(i2))-N(i).Slave5x5(used(i2)))/(49-25)];
            Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
        end
        for i2=length(used)+1:NF
            AVtraceINTC{i2}=[AVtraceINTC{i2} 0];
            AVtraceZC{i2}=[AVtraceZC{i2} 0];
            %AVtraceLifeactC{i2}=[AVtraceLifeactC{i2} 0];
        end
        CountsT=CountsT+1;
        end
    end
end
AVtraceINTt=AVtraceINT/CountsT;
AVtraceZt=AVtraceZ/CountsT;
AVtraceINT=AVtraceINT./Counts;
AVtraceZ=AVtraceZ./Counts;
AVtraceLifeactt=AVtraceLifeact/CountsT;
AVtraceLifeactt=AVtraceLifeactt/max(AVtraceLifeactt);
AVtraceINTt=AVtraceINTt/max(AVtraceINTt);

for i=1:NF
SEz(i)=sqrt(var(AVtraceZC{i}))/sqrt(length(AVtraceZC{i}));
SEint(i)=sqrt(var(AVtraceINTC{i}))/sqrt(length(AVtraceINTC{i}));
SElif(i)=sqrt(var(AVtraceLifeactC{i}))/sqrt(length(AVtraceLifeactC{i}));
MEz(i)=mean(AVtraceZC{i});
MEint(i)=mean(AVtraceINTC{i});
MElif(i)=mean(AVtraceLifeactC{i});
end
%AVtraceZt=AVtraceZt/max(AVtraceZt);
% plot(AVtraceINT,'b')
% hold on
% plot(AVtraceZ,'r')
% xlabel('Frames from the end of the trace')
% ylabel('Average Trace')
% title('Z position (red), Intensity (blue)')
% figure .
x=(1:NF)*4;
x=(NF+1)*4-x;
 subplot(1,2,1)
% %plot(x,MEint/max(MEint),'b')
PlotShadedErrorBars(x,MElif/max(MElif),SElif/max(MElif),[0 0 0],[1 0 0])
 PlotShadedErrorBars(x,MEint/max(MEint),SEint/max(MEint),[0 128/255*.75 .75],[0 128/255 1])
% hold on
 subplot(1,2,2)
plot(x,MEz,'Color',[.5 .5 .5])


% PlotShadedErrorBars(x,MEz,SEz,[.5 .5 .5])
% ylabel('Average Z-Position (nm)')
% title('Z-Position (nm)')
% subplot(1,2,2)
%plot(x,MElif/max(MElif),'r')

title(strcat('Lifeact Intensity (red), AP2 Intensity (blue)'))

%ylim([-10 30])
% box off
% % Create second Y axes on the right.
% a2 = axes('YAxisLocation', 'Right')
% % Hide second plot.
% set(a2, 'color', 'none')
% set(a2, 'XTick', [])
% % Set scala for second Y.
% set(a2, 'YLim', [-10/25 30/25])

ylabel('Average Intensity (AU)')
xlabel('Time (s)')
%ylabel('Average Trace (Trace Ends Count as 0)')

end