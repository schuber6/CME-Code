function VisualizeClusterTraces_DSIO_All80(clusters,G,FXYCMS)

Pop=zeros(length(clusters),2);
LT=zeros(length(clusters),2);

for i=1:10
    Ns(i)=length(find(G==i));
end
figure
for i=1:1 %length(clusters)
    Is=clusters(i).index;
    Gs=G(Is);
    for i2=9:9
        used{i2}=find(Gs==i2);
        for i3=1:length(used{i2})
            SuperSubplot(i3)
            fxyc=FXYCMS{used{i2}(i3)};
            t=(1:length(fxyc(:,1)))*2;
            plot(t,fxyc(:,6),'r')
            hold on
            plot(t,fxyc(:,7),'g')
        end
    end
end
