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
end
figure
bar(Pop)
xlim([.5 2.5])
xlabel('Cluster')
ylabel('Percent of Traces')
legend('Control Cells','siRNA Cells')
figure
bar([.85 1.85],LT(1:2,1),.2,'b')
hold on
bar([1.15 2.15],LT(1:2,2),.2,'r')
errorbar([.85 1.85],LT(1:2,1),SD(1:2,1),'.')
errorbar([1.15 2.15],LT(1:2,2),SD(1:2,2),'.')
xticks([1 2])
xlim([.5 2.5])
xlabel('Cluster')
legend('Control Cells','siRNA Cells')
ylabel('Average Lifetime (s)')