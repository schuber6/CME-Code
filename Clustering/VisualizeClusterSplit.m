function VisualizeClusterSplit(clusters,N1,N2,LTs)

Pop=zeros(length(clusters),2);
LT=zeros(length(clusters),2);
for i=1:length(clusters)
    Is=clusters(i).index;
    used1=find(Is<=N1);
    used2=find(Is>N1);
    P1=length(used1);
    P2=length(used2);
    Pop(i,:)=[P1/N1 P2/N2];
    LT(i,1)=mean(LTs(used1));
    LT(i,2)=mean(LTs(used2));
    SD(i,1)=sqrt(var(LTs(used1)));
    SD(i,2)=sqrt(var(LTs(used2)));
    SE(i,1)=sqrt(var(LTs(used1)))/sqrt(length(used1));
    SE(i,2)=sqrt(var(LTs(used2)))/sqrt(length(used2));
end
figure
bar([.85 1.85 2.85],Pop(1:3,1)*100,.2,'c','FaceAlpha',.75)
hold on
bar([1.15 2.15 3.15],Pop(1:3,2)*100,.2,'r','FaceAlpha',.75)
%xlim([.5 4.5])

xticks([1 2 3])

legend('Control Cells','siRNA Cells')
xlim([.5 3.5])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',13)
ylabel('Percent of Traces','FontSize',20)
xlabel('Cluster','FontSize',20)
figure
bar([.85 1.85 2.85],LT(1:3,1),.2,'c','FaceAlpha',.75)
hold on
bar([1.15 2.15 3.15],LT(1:3,2),.2,'r','FaceAlpha',.75)
errorbar([.85 1.85 2.85],LT(1:3,1),SE(1:3,1),'k.')
errorbar([1.15 2.15 3.15],LT(1:3,2),SE(1:3,2),'k.')
xticks([1 2 3])
xlim([.5 3.5])
ylim([0 95])
legend('Control Cells','siRNA Cells')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',13)
xlabel('Cluster','FontSize',20)
ylabel('Average Lifetime (s)','FontSize',20)