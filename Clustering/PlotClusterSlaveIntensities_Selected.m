function PlotClusterSlaveIntensities_Selected(IntCellS,IntCellM,clusters,Gs,Sel,px,py)


figure
for i=1:length(Sel)
    Is=clusters(Sel(i)).index;
    cgroups=Gs(Is);
    used1=find(cgroups==1);
    used2=find(cgroups==2);
    Cat1{i}=zeros(1,length(IntCellS{1})).';
    for i2=1:length(used1)
        Cat1{i}=Cat1{i}+IntCellS{Is(used1(i2))};
    end
    Cat1{i}=Cat1{i}/length(used1);
    Cat2{i}=zeros(1,length(IntCellS{1})).';
    for i2=1:length(used2)
        Cat2{i}=Cat2{i}+IntCellS{Is(used2(i2))};
    end
    Cat2{i}=Cat2{i}/length(used2);
    subplot(px,py,i+py)
    plot(Cat1{i},'c','linewidth',2)
    hold on
    plot(Cat2{i},'r','linewidth',2)
%     if i==1
%         legend('Control','siRNA')
%     end
    xticks([0 25 50 75 100])
    ylim([0 .85])
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
    Cat1{i}=zeros(1,length(IntCellM{1})).';
    for i2=1:length(used1)
        Cat1{i}=Cat1{i}+IntCellM{Is(used1(i2))};
    end
    Cat1{i}=Cat1{i}/length(used1);
    Cat2{i}=zeros(1,length(IntCellM{1})).';
    for i2=1:length(used2)
        Cat2{i}=Cat2{i}+IntCellM{Is(used2(i2))};
    end
    Cat2{i}=Cat2{i}/length(used2);
    subplot(px,py,i)
    plot(Cat1{i},'c','linewidth',2)
    hold on
    plot(Cat2{i},'r','linewidth',2)

    %if i==1
        legend({strcat('Control: N=',num2str(length(used1))),strcat('siRNA: N=',num2str(length(used2)))},'Location','south','FontSize',16)
    %end
    xticks([0 25 50 75 100])
        ylim([0 .85])
    a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
    ylabel('Clathrin Intensity','FontSize',20)
    xlabel('Percent of Trace Completed','FontSize',20)
        title(strcat('Cluster #',num2str(i)),'FontSize',20)
end