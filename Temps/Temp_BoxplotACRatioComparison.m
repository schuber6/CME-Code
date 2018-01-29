XG=[];
for i=1:length(CC)
    XG=[XG ; [log(FapC(i)/FclC(i))-log(IapC(i)/IclC(i)) 1]];
end
for i=1:length(CO)
    XG=[XG ; [log(FapO(i)/FclO(i))-log(IapO(i)/IclO(i)) 2]];
end
figure
boxplot(XG(:,1),XG(:,2),'Labels',{'Control','Osmoshock'})
ylabel('Change in Log A:C Ratio')