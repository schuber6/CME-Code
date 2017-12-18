scatter(SH(:,1),SH(:,3)./SH(:,4),'r')
hold on
scatter(nSH(:,1),nSH(:,3)./nSH(:,4),'b')
title('Changes in Initiation Densities During Osmotic Shock')
xlabel('Water Percent')
ylabel('Decrease in Initiation Density')
line(xlim,[1 1],'Color','k')

figure

scatter(SH(:,1),SH(:,5)./SH(:,6),'r')
hold on
scatter(nSH(:,1),nSH(:,5)./nSH(:,6),'b')
title('Changes in Conclusion Densities During Osmotic Shock')
xlabel('Water Percent')
ylabel('Decrease in Conclusion Density')
line(xlim,[1 1],'Color','k')

figure

scatter(SH(:,1),SH(:,3)./SH(:,5),'r')
hold on
scatter(nSH(:,1),nSH(:,3)./nSH(:,5),'b')
title('Difference between pre-osmoshock initiation and conclusion densities')
xlabel('Water Percent')
ylabel('Difference between pre-osmoshock initiation and conclusion densities')
line(xlim,[1 1],'Color','k')

figure

scatter(SH(:,1),SH(:,4)./SH(:,6),'r')
hold on
scatter(nSH(:,1),nSH(:,4)./nSH(:,6),'b')
title('Difference between post-osmoshock initiation and conclusion densities')
xlabel('Water Percent')
ylabel('Difference between post-osmoshock initiation and conclusion densities')
line(xlim,[1 1],'Color','k')

