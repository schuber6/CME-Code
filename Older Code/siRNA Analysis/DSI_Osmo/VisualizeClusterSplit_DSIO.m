function VisualizeClusterSplit_DSIO(clusters,G,LTs,Areas)

Pop=zeros(length(clusters),2);
LT=zeros(length(clusters),2);

for i=1:10
    Ns(i)=length(find(G==i));
end

for i=1:length(clusters)
    Is=clusters(i).index;
    Gs=G(Is);
    for i2=1:10
        used{i2}=find(Gs==i2);
        P(i,i2)=length(used{i2});
        if ~isempty(Areas)
        PA(i,i2)=length(used{i2})/Areas(i2);
        end
        Pop(i,i2)=P(i,i2)/Ns(i2);
        LT(i,i2)=mean(LTs(used{i2}));
        SD(i,i2)=sqrt(var(LTs(used{i2})));
    end
end
figure
bar(P)
%xlim([.5 2.5])
xlabel('Cluster')
ylabel('Number of Traces')
figure
bar(Pop)
%xlim([.5 2.5])
xlabel('Cluster')
ylabel('Percent of Traces')
if ~isempty(Areas)
figure
bar(PA)
xlabel('Cluster')
ylabel('Traces per Area')
end
%legend('Control Cells','siRNA Cells')
figure
bar(LT)
xlabel('Cluster')
legend('Control Cells','siRNA Cells')
ylabel('Average Lifetime (s)')