function PlotClusterSlaveIntensities_Selected(IntCellS,IntCellM,clusters,Gs,Sel,px,py)

Peaks1S=cell(1,3);
Peaks2S=cell(1,3);
Peaks1M=cell(1,3);
Peaks2M=cell(1,3);
figure
for i=1:length(Sel)
    Is=clusters(Sel(i)).index;
    cgroups=Gs(Is);
    used1=find(cgroups==1);
    used2=find(cgroups==2);
    [Cat1{i},Csdt1{i},Cset1{i}]=AverageTraceData(IntCellS,Is(used1));
    [Cat2{i},Csdt2{i},Cset2{i}]=AverageTraceData(IntCellS,Is(used2));
    u1=Is(used1);
    for i2=1:length(u1)
        TS=IntCellS{u1(i2)};
        indS=find(TS==max(TS),1,'last');
        Peaks1S{i}=[Peaks1S{i} indS(1)];
        TM=IntCellM{u1(i2)};
        indM=find(TM==max(TM),1,'last');
        Peaks1M{i}=[Peaks1M{i} indM(1)];
    end
    u2=Is(used2);
    for i2=1:length(u2)
        TS=IntCellS{u2(i2)};
        indS=find(TS==max(TS),1,'last');
        Peaks2S{i}=[Peaks2S{i} indS(1)];
        TM=IntCellM{u2(i2)};
        indM=find(TM==max(TM),1,'last');
        Peaks2M{i}=[Peaks2M{i} indM(1)];
    end
%     Cat1{i}=zeros(1,length(IntCellS{1})).';
%     for i2=1:length(used1)
%         Cat1{i}=Cat1{i}+IntCellS{Is(used1(i2))};
%     end
%     Cat1{i}=Cat1{i}/length(used1);
%     Cat2{i}=zeros(1,length(IntCellS{1})).';
%     for i2=1:length(used2)
%         Cat2{i}=Cat2{i}+IntCellS{Is(used2(i2))};
%     end
%     Cat2{i}=Cat2{i}/length(used2);
    subplot(px,py,i+py)
    PlotShadedErrorBars((1:100)-1,Cat1{i},Csdt1{i},'c','c');
%     plot(Cat1{i},'c','linewidth',2)
    hold on
    PlotShadedErrorBars((1:100)-1,Cat2{i},Csdt2{i},'r','r');
    %plot(Cat2{i},'r','linewidth',2)
%     if i==1
%         legend('Control','siRNA')
%     end
    xticks([0 25 50 75 100])
    ylim([0 1])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
    ylabel('CALM Intensity','FontSize',20)
    xlabel('Percent of Trace Completed','FontSize',20)


end
for i=1:length(Sel)
    Is=clusters(Sel(i)).index;
    cgroups=Gs(Is);
    used1=find(cgroups==1);
    used2=find(cgroups==2);
    [Cat1{i},Csdt1{i}]=AverageTraceData(IntCellM,Is(used1));
    [Cat2{i},Csdt2{i}]=AverageTraceData(IntCellM,Is(used2));

%     Cat1{i}=zeros(1,length(IntCellM{1})).';
%     for i2=1:length(used1)
%         Cat1{i}=Cat1{i}+IntCellM{Is(used1(i2))};
%     end
%     Cat1{i}=Cat1{i}/length(used1);
%     Cat2{i}=zeros(1,length(IntCellM{1})).';
%     for i2=1:length(used2)
%         Cat2{i}=Cat2{i}+IntCellM{Is(used2(i2))};
%     end
%     Cat2{i}=Cat2{i}/length(used2);
    subplot(px,py,i)
    O1=PlotShadedErrorBars((1:100)-1,Cat1{i},Csdt1{i},'c','c');
%     plot(Cat1{i},'c','linewidth',2)
    hold on
    O2=PlotShadedErrorBars((1:100)-1,Cat2{i},Csdt2{i},'r','r');

    %if i==1
        legend([O1 O2],{strcat('Control: N=',num2str(length(used1))),strcat('siRNA: N=',num2str(length(used2)))},'Location','south','FontSize',16)
    %end
    xticks([0 25 50 75 100])
        ylim([0 1])
    a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
    ylabel('Clathrin Intensity','FontSize',20)
    xlabel('Percent of Trace Completed','FontSize',20)
        title(strcat('Cluster #',num2str(i)),'FontSize',20)
end
Xs=[.85 1.85 2.85];
M1S=StatCell_Fancy(Peaks1S,@mean);
M2S=StatCell_Fancy(Peaks2S,@mean);
M1M=StatCell_Fancy(Peaks1M,@mean);
M2M=StatCell_Fancy(Peaks2M,@mean);
S1S=StatCell_Fancy(Peaks1S,@std)./sqrt(StatCell_Fancy(Peaks1S,@length));
S2S=StatCell_Fancy(Peaks2S,@std)./sqrt(StatCell_Fancy(Peaks2S,@length));
S1M=StatCell_Fancy(Peaks1M,@std)./sqrt(StatCell_Fancy(Peaks1M,@length));
S2M=StatCell_Fancy(Peaks2M,@std)./sqrt(StatCell_Fancy(Peaks2M,@length));

% Xs=[.85 1.15 1.85 2.15];
% Ms=[mean(Peaks2S) mean(Peaks1S) mean(Peaks2M) mean(Peaks1M)];
% SEs=[sqrt(var(Peaks2S))/sqrt(length(Peaks2S)) sqrt(var(Peaks1S))/sqrt(length(Peaks1S)) sqrt(var(Peaks2M))/sqrt(length(Peaks2M)) sqrt(var(Peaks1M))/sqrt(length(Peaks1M))];
figure
for i=1:3
    subplot(1,3,i)
    PeakPlot([M1S(i) M2S(i) M1M(i) M2M(i)],[S1S(i) S2S(i) S1M(i) S2M(i)])
    if i==1
        xticks([.85 1.15 1.85 2.15])
        xticklabels({'siRNA CALM','Control CALM','siRNA Clathrin','Control Clathrin'})
    else
        xticks([])
    end
    title(strcat('Cluster # ',num2str(i)))
end
% O(1)=errorbar(Xs,M1S,S1S,'co');
% hold on
% O(2)=errorbar(Xs+.3,M2S,S2S,'ro');
% errorbar(Xs+3,M1M,S1M,'co')
% errorbar(Xs+3.3,M2M,S2M,'ro')

%xlim([.5 2.5])
%xticks(Xs)
%xticklabels({'siRNA CALM','Control CALM','siRNA Clathrin','Control Clathrin'})
% xticks([1 2 3 4 5 6])
% %xticklabels({'
% ylabel('Percent of trace where signal is peaked')
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',14)
% YL=ylim;
% line([3.5 3.5],YL,'Color','k')
% legend(O,{'Control Cells','CALM siRNA Cells'})
% view([90 -90])

% ylim([0 100])
% subplot(1,2,2)
% BoxPlotCell({Peaks1S,Peaks2S})
% ylim([0 100])
end
function PeakPlot(Ms,Ss)

    Xs=[.85 1.15 1.85 2.15];
    errorbar(Xs,Ms,Ss,'o')
    hold on

    ylabel('Percent of trace where signal is peaked')
    YL=ylim;
    line([1.5 1.5],YL,'Color','k')
    ylim(YL)
    view([90 -90])
end