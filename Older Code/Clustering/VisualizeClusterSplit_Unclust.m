function VisualizeClusterSplit_Unclust(clusters,N1,N2,LTs,Cs,NC1)

usedWT=1:NC1;
usedSI=NC1+1:max(Cs);
Pop=zeros(length(clusters),2);
LT=zeros(length(clusters),2);
for i=1:4 %length(clusters)
    Is=clusters(i).index;
    if i==4
        for i2=4:length(clusters)
            Is=[Is ; clusters(i2).index];
        end
    end
    used1=find(Is<=N1);
    used2=find(Is>N1);
    P1=length(used1);
    P2=length(used2);
    Pop(i,:)=[P1/N1 P2/N2];
    for i2=1:max(Cs)
        usedC=find(Cs(Is)==i2);
        usedCTot=find(Cs==i2);
        PopC{i}(i2)=length(usedC)/length(usedCTot);
    end
    
    SDpt(i,1)=sqrt(var(PopC{i}(usedWT)));
    SDpt(i,2)=sqrt(var(PopC{i}(usedSI)));
    SEpt(i,1)=sqrt(var(PopC{i}(usedWT)))/sqrt(length(usedWT));
    SEpt(i,2)=sqrt(var(PopC{i}(usedSI)))/sqrt(length(usedSI));
    LT(i,1)=mean(LTs(used1));
    LT(i,2)=mean(LTs(used2));
    SD(i,1)=sqrt(var(LTs(used1)));
    SD(i,2)=sqrt(var(LTs(used2)));
    SE(i,1)=sqrt(var(LTs(used1)))/sqrt(length(used1));
    SE(i,2)=sqrt(var(LTs(used2)))/sqrt(length(used2));
end
figure
WideDoubleBar(Pop(1:4,:),SEpt(1:4,:))
xticklabels({'1','2','3','Other'})
legend('Control Cells','siRNA Cells')
ylabel('Percent of Traces','FontSize',20)
xlabel('Cluster','FontSize',20)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',13)
% yticks(0:5:40)
% bar([.85 1.85 2.85 3.85],Pop(1:4,1)*100,.2,'c','FaceAlpha',.75)
% hold on
% bar([1.15 2.15 3.15 4.15],Pop(1:4,2)*100,.2,'r','FaceAlpha',.75)
% errorbar([.85 1.85 2.85 3.85],Pop(1:4,1)*100,SEpt(1:4,1)*100,'k.')
% errorbar([1.15 2.15 3.15 4.15],Pop(1:4,2)*100,SEpt(1:4,2)*100,'k.')
% 
% xticks([1 2 3 4])
% xticklabels({1,2,3,'Other'})
% 
% legend('Control Cells','siRNA Cells')
% ylim([0 45])
% xlim([.5 4.5])
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',13)
% ylabel('Percent of Traces','FontSize',20)
% xlabel('Cluster','FontSize',20)
figure
WideDoubleBar(LT(1:4,:),SE(1:4,:))
% bar([.85 1.85 2.85 3.85],LT(1:4,1),.2,'c','FaceAlpha',.75)
% hold on
% bar([1.15 2.15 3.15 4.15],LT(1:4,2),.2,'r','FaceAlpha',.75)
% errorbar([.85 1.85 2.85 3.85],LT(1:4,1),SE(1:4,1),'k.')
% errorbar([1.15 2.15 3.15 4.15],LT(1:4,2),SE(1:4,2),'k.')
xticklabels({'1','2','3','Other'})
legend('Control Cells','siRNA Cells')
legend('Control Cells','siRNA Cells')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',13)
xlabel('Cluster','FontSize',20)
ylabel('Average Lifetime (s)','FontSize',20)