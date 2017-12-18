SHPreCs=[PreCs20 PreCs40 PreCs60 PreCs80];
nSHPreCs=[nPreCs20 nPreCs40 nPreCs60 nPreCs80];
SHPreIs=[PreIs20 PreIs40 PreIs60 PreIs80];
nSHPreIs=[nPreIs20 nPreIs40 nPreIs60 nPreIs80];


errorbar([20 40 60 80],[PCM20 PCM40 PCM60 PCM80],[EBPC20 EBPC40 EBPC60 EBPC80],'r')
hold on
errorbar([20 40 60 80],[nPCM20 nPCM40 nPCM60 nPCM80],[nEBPC20 nEBPC40 nEBPC60 nEBPC80],'b')
errorbar([0],[mean(nSHPreCs)],[sqrt(var(nSHPreCs))/sqrt(length(nSHPreCs))],'b')
errorbar([0],[mean(SHPreCs)],[sqrt(var(SHPreCs))/sqrt(length(SHPreCs))],'r')
B=1.3*10^(-4);
YL=ylim;
ylim([B*.9 YL(2)])
text(0,B,strcat('n=',num2str(length(SHPreCs))),'Color','r')
text(0,B*.95,strcat('n=',num2str(length(nSHPreCs))),'Color','b')
text(20,B,strcat('n=',num2str(length(PreCs20))),'Color','r')
text(20,B*.95,strcat('n=',num2str(length(nPreCs20))),'Color','b')
text(40,B,strcat('n=',num2str(length(PreCs40))),'Color','r')
text(40,B*.95,strcat('n=',num2str(length(nPreCs40))),'Color','b')
text(60,B,strcat('n=',num2str(length(PreCs60))),'Color','r')
text(60,B*.95,strcat('n=',num2str(length(nPreCs60))),'Color','b')
text(80,B,strcat('n=',num2str(length(PreCs80))),'Color','r')
text(80,B*.95,strcat('n=',num2str(length(nPreCs80))),'Color','b')
title('Conclusion Density Pre-Osmoshock')
xlabel('Percent Water')
ylabel('Conclusion Density Pre-Osmoshock (#/pixel)')
legend('RNAi','No RNAi')

figure

errorbar([20 40 60 80],[PIM20 PIM40 PIM60 PIM80],[EBPI20 EBPI40 EBPI60 EBPI80],'r')
hold on
errorbar([20 40 60 80],[nPIM20 nPIM40 nPIM60 nPIM80],[nEBPI20 nEBPI40 nEBPI60 nEBPI80],'b')
errorbar([0],[mean(nSHPreIs)],[sqrt(var(nSHPreIs))/sqrt(length(nSHPreIs))],'b')
errorbar([0],[mean(SHPreIs)],[sqrt(var(SHPreIs))/sqrt(length(SHPreIs))],'r')
B=1.5*10^(-4);
YL=ylim;
ylim([B*.9 YL(2)])
text(0,B,strcat('n=',num2str(length(SHPreIs))),'Color','r')
text(0,B*.95,strcat('n=',num2str(length(nSHPreIs))),'Color','b')
text(20,B,strcat('n=',num2str(length(PreIs20))),'Color','r')
text(20,B*.95,strcat('n=',num2str(length(nPreIs40))),'Color','b')
text(40,B,strcat('n=',num2str(length(PreIs40))),'Color','r')
text(40,B*.95,strcat('n=',num2str(length(nPreIs40))),'Color','b')
text(60,B,strcat('n=',num2str(length(PreIs60))),'Color','r')
text(60,B*.95,strcat('n=',num2str(length(nPreIs60))),'Color','b')
text(80,B,strcat('n=',num2str(length(PreIs80))),'Color','r')
text(80,B*.95,strcat('n=',num2str(length(nPreIs80))),'Color','b')
title('Initiation Density Pre-Osmoshock')
xlabel('Percent Water')
ylabel('Initiation Density Pre-Osmoshock (#/pixel)')
legend('RNAi','No RNAi')


