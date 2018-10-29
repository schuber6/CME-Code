function PlotClusterSlaveIntensities_Selected_Selected(IntCellS,IntCellM,clusters,Gs,GSel,Sel,px,py)


figure
for i=1:length(Sel)
    Is=clusters(Sel(i)).index;
    cgroups=Gs(Is);
    for i2=1:length(GSel)
        used{i2}=find(cgroups==GSel(i2));
        Cat{i2}{i}=zeros(1,length(IntCellS{1})).';
        for i3=1:length(used{i2})
            Cat{i2}{i}=Cat{i2}{i}+IntCellS{Is(used{i2}(i3))};
        end
        Cat{i2}{i}=Cat{i2}{i}/length(used{i2});
    end
    subplot(px,py,i+py)
    for i2=1:length(GSel)
        plot(Cat{i2}{i},'linewidth',2)
        hold on
    end
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
       for i2=1:length(GSel)
        used{i2}=find(cgroups==GSel(i2));
        Cat{i2}{i}=zeros(1,length(IntCellM{1})).';
        for i3=1:length(used{i2})
            Cat{i2}{i}=Cat{i2}{i}+IntCellM{Is(used{i2}(i3))};
        end
        Cat{i2}{i}=Cat{i2}{i}/length(used{i2});
    end
    subplot(px,py,i)
    for i2=1:length(GSel)
        plot(Cat{i2}{i},'linewidth',2)
        hold on
    end
    xticks([0 25 50 75 100])
        ylim([0 .85])
    a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
    ylabel('Clathrin Intensity','FontSize',20)
    xlabel('Percent of Trace Completed','FontSize',20)
        title(strcat('Cluster #',num2str(i)),'FontSize',20)
end