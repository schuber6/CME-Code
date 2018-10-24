function PlotClusterSlaveIntensities_Selected(IntCellS,IntCellM,clusters,Gs,Sel,px,py)


figure
for i=1:length(Sel)
    Is=clusters(Sel(i)).index;
    cgroups=Gs(Is);
    used1=find(cgroups==1);
    used2=find(cgroups==2);
    [Cat1{i},Csdt1{i},Cset1{i}]=AverageTraceData(IntCellS,Is(used1));
    [Cat2{i},Csdt2{i},Cset2{i}]=AverageTraceData(IntCellS,Is(used2));
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