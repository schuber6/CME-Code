clear all

NCoh=10;
ICoh=400;
NF=20;

IntCutoff=400;
SlaveCutoff=10000;
Zers=0;  %Make this 1 if you want ended traces to count as zeros
% fg=[0 .6 .4 2.5 2.5 .6 .4 2.5 2.5];
% zg=[0 100 200 200 200 100 200 200 200];
 fg=[3 3 3 3 3 3 3 3];
 zg=[300 300 300 300 300 300 300 300];
 movies{1}='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo004_AP2_BS_MasterSlaveFast_v3.mat';
 movies{2}='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo007_AP2_BS_MasterSlaveFast_v3.mat';
 movies{3}='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo008_AP2_BS_MasterSlaveFast_v3.mat';
 movies{4}='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo009_AP2_BS_MasterSlaveFast_v3.mat';


for i0=1:length(movies)
    
     AVtraceINTC=cell(NCoh+1,NF);
AVtraceZC=cell(NCoh+1,NF);
AVtraceLifeactC=cell(NCoh+1,NF);
MaxLifeact=[];
MaxAP2=[];
Lifet=[];
    load(movies{i0});    
figure
    N=NSTAgood;
AVtraceINT=zeros(1,NF);
AVtraceZ=zeros(1,NF);
AVtraceLifeact=zeros(1,NF);

Counts=zeros(1,NF);
CountsT=0;
for i=1:length(N)
    if N(i).class==0
        used=find(N(i).int>=IntCutoff,NF,'last');
        Coh=NCoh+1;
        
        for i2=1:NCoh
            if median(N(i).int)<i2*ICoh
                Coh=i2;
                break
            end
        end
        if  mean(N(i).Slave5x5(used))>=SlaveCutoff && Coh~=0 && length(used)>=7%~isempty(used) %length(used)>=7 %Eliminate too short traces and traces in cells not expressing the slave flourophore
            OrdLif=sort(N(i).SlaveBS,'descend');
            OrdAP2=sort(N(i).int,'descend');
%             MaxLifeact=[MaxLifeact OrdLif(3)];
%             MaxAP2=[MaxAP2 OrdAP2(3)];
            MaxLifeact=[MaxLifeact median(N(i).SlaveBS(used))];
            MaxAP2=[MaxAP2 median(N(i).int(used))];
            Lifet=[Lifet length(N(i).frame)];
        medZ=median(N(i).st(used));
        %medZ=min(N(i).st(used));
        for i2=1:length(used)
            AVtraceINT(1+length(used)-i2)=AVtraceINT(1+length(used)-i2)+N(i).int(used(i2))/max(N(i).int);
            AVtraceZ(1+length(used)-i2)=AVtraceZ(1+length(used)-i2)+(N(i).st(used(i2))-medZ)*zg(i0);
            AVtraceLifeact(1+length(used)-i2)=AVtraceLifeact(1+length(used)-i2)+N(i).Slave5x5(used(i2))/25-(N(i).Slave7x7(used(i2))-N(i).Slave5x5(used(i2)))/(49-25);
            AVtraceINTC{Coh,1+length(used)-i2}=[AVtraceINTC{Coh,1+length(used)-i2} N(i).int(used(i2))]; %/max(N(i).int)];
            AVtraceZC{Coh,1+length(used)-i2}=[AVtraceZC{Coh,1+length(used)-i2} (N(i).st(used(i2))-medZ)*zg(i0)];
            AVtraceLifeactC{Coh,1+length(used)-i2}=[AVtraceLifeactC{Coh,1+length(used)-i2} N(i).SlaveBS(used(i2))];%N(i).Slave5x5(used(i2))/25-(N(i).Slave7x7(used(i2))-N(i).Slave5x5(used(i2)))/(49-25)];
            Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
        end
        if Zers
        for i2=length(used)+1:NF
            AVtraceINTC{Coh,i2}=[AVtraceINTC{Coh,i2} 0];
            AVtraceZC{Coh,i2}=[AVtraceZC{Coh,i2} 0];
            AVtraceLifeactC{Coh,i2}=[AVtraceLifeactC{Coh,i2} 0];
        end
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

for i2=1:NCoh+1
for i=1:NF
SEz(i,i2)=sqrt(var(AVtraceZC{i2,i}))/sqrt(length(AVtraceZC{i2,i}));
SEint(i,i2)=sqrt(var(AVtraceINTC{i2,i}))/sqrt(length(AVtraceINTC{i2,i}));
SElif(i,i2)=sqrt(var(AVtraceLifeactC{i2,i}))/sqrt(length(AVtraceLifeactC{i2,i}));
MEz(i,i2)=mean(AVtraceZC{i2,i});
MEint(i,i2)=mean(AVtraceINTC{i2,i});
MElif(i,i2)=mean(AVtraceLifeactC{i2,i});
end
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
% subplot(1,2,1)
% %plot(x,MEint/max(MEint),'b')
for i2=1:NCoh+1
% PlotShadedErrorBars(x,MElif(:,i2)/max(max(MElif)),SElif(:,i2)/max(max(MElif)),[0 0 0],[1 0 0])
% hold on
%  PlotShadedErrorBars(x,MEint(:,i2)/max(max(MEint)),SEint(:,i2)/max(max(MEint)),[0 128/255*.75 .75],[0 128/255 1])
%  hold on
subplot(2,ceil((NCoh+1)/2),i2)
%plot(x,MElif(:,i2)/max(max(MElif)),'Color',[1/i2*.5+.5 0 0])
PlotShadedErrorBars(x,MElif(:,i2)/max(max(MElif)),SElif(:,i2)/max(max(MElif)),[0 0 0],[1 0 0])
title(strcat('Intensity Cohort: ',num2str((i2-1)*ICoh),'-',num2str((i2)*ICoh),' s'))
if i2==1
    ylabel('Intensity')
end
xlim([0 max(x)])
hold on
YLL(i2,:)=ylim;
%xlim([140 200])
subplot(2,ceil((NCoh+1)/2),i2)
%plot(x,MEint(:,i2)/max(max(MEint)),'Color',[0 0 1/i2*.5+.5])
PlotShadedErrorBars(x,MEint(:,i2)/max(max(MEint)),SEint(:,i2)/max(max(MEint)),[0 128/255*.75 .75],[0 128/255 1])
if i2==1
    ylabel('Intensity')
end
xlim([0 max(x)])
YLI(i2,:)=ylim;
%xlim([140 200])
hold on
end
for i2=1:NCoh+1
    subplot(2,ceil((NCoh+1)/2),i2)
    ylim([0 1.1])
    %ylim([0 max(YLL(:,2))])
%     subplot(2,NCoh,i2+5)
%     ylim([0 max(YLI(:,2))])
end
figure
scatter(MaxAP2,MaxLifeact)
xlabel('AP2 Intensity')
ylabel('Lifeact Intensity')
figure
scatter(Lifet,MaxAP2)
xlabel('Lifetime')
ylabel('AP2 Intensity')
figure
scatter(Lifet,MaxLifeact)
xlabel('Lifetime')
ylabel('Lifeact Intensity')
% hold on
% subplot(1,2,2)
%plot(x,MEz,'Color',[.5 .5 .5])


% PlotShadedErrorBars(x,MEz,SEz,[.5 .5 .5])
% ylabel('Average Z-Position (nm)')
% title('Z-Position (nm)')
% subplot(1,2,2)
%plot(x,MElif/max(MElif),'r')

%title(strcat('Lifeact Intensity (red), AP2 Intensity (blue)'))

%ylim([-10 30])
% box off
% % Create second Y axes on the right.
% a2 = axes('YAxisLocation', 'Right')
% % Hide second plot.
% set(a2, 'color', 'none')
% set(a2, 'XTick', [])
% % Set scala for second Y.
% set(a2, 'YLim', [-10/25 30/25])

%ylabel('Average Intensity (AU)')
%xlabel('Time (s)')
%ylabel('Average Trace (Trace Ends Count as 0)')

end