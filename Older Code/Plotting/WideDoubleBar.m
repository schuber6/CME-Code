function WideDoubleBar(H,E)

spacing=.7;
X=spacing:spacing:(spacing*length(H(:,1)));
W=.38;
b(1)=bar(X-.15,H(:,1),W,'FaceAlpha',.75);
hold on
b(2)=bar(X+.15,H(:,2),W,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar(X-.15,H(:,1),E(:,1),'.','Color','k')
errorbar(X+.15,H(:,2),E(:,2),'.','Color','k')
xticks(X)
xlim([X(1)-.35 X(end)+.35])
