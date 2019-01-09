function VisualizeClusterTraces_DSIO(clusters,G,FXYCMS)

Pop=zeros(length(clusters),2);
LT=zeros(length(clusters),2);

for i=1:10
    Ns(i)=length(find(G==i));
end
figure
for i=1:1 %length(clusters)
    Is=clusters(i).index;
    Gs=G(Is);
    for i2=1:10
        used{i2}=find(Gs==i2);
        for i3=1:5
            R=ceil(rand*length(used{i2}));
            subplot(5,10,(i2-1)*5+i3)
            fxyc=FXYCMS{used{i2}(R)};
            plot(fxyc(:,6),'r')
            hold on
            plot(fxyc(:,7),'g')
        end
    end
end
