function PlotClusterSlaveIntensities(IntCellS,clusters,Gs)

for i=1:length(clusters)
    Is=clusters(i).index;
    cgroups=Gs(Is);
    used1=find(cgroups==1);
    used2=find(cgroups==2);
    Cat1{i}=zeros(1,length(IntCellS{1}));
    for i2=1:length(used1)
        Cat1{i}=Cat1{i}+IntCellS{Is(used1(i2))};
    end
    Cat1{i}=Cat1{i}/length(used1);
    Cat2{i}=zeros(1,length(IntCellS{1}));
    for i2=1:length(used2)
        Cat2{i}=Cat2{i}+IntCellS{Is(used2(i2))};
    end
    Cat2{i}=Cat2{i}/length(used2);
    SuperSubplot(i)
    plot(Cat1{i},'g')
    hold on
    plot(Cat2{i},'r')
end