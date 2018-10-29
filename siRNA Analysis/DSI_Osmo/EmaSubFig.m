function EmaSubFig(Data,CBins,plt,Comp,ttl,ylab)

bins=40;
FS=12;
YL=[0 25];
YT=[0 5 10 15 20];
XT=0:5;
XL=[0 5];
PRCs=[.25 .50 .75];

subplot(2,5,plt)
[H,CBins]=hist(Data/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title(ttl)
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Comp Comp],YL,'Color','r','LineStyle','--')
legend(strcat('N=',num2str(sum(H))))
if ylab
    ylabel('Coated Pits \newline % Events')
end
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,plt+5)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
if ylab
    ylabel('         Coated Pits \newline Cumulative Frequency')
    line([Comp Comp],[0 .5],'Color','r','LineStyle','--')
end
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)