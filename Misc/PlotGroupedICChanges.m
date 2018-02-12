errorbar([20 40 57.5 80],[CM20 CM40 CM60 CM80],[EBC20 EBC40 EBC60 EBC80],'r')
hold on
errorbar([26 40 53.5 78],[CMn20 CMn40 CMn60 CMn80],[EBCn20 EBCn40 EBCn60 EBCn80],'b')
title('Relative Conclusion Densities Post-Osmoshock')
xlabel('Percent Water')
ylabel('Relative Conclusion Density')
legend('RNAi','Control')


figure

errorbar([20 40 57.5 80],[IM20 IM40 IM60 IM80],[EBI20 EBI40 EBI60 EBI80],'r')
hold on
errorbar([26 40 53.5 78],[IMn20 IMn40 IMn60 IMn80],[EBIn20 EBIn40 EBIn60 EBIn80],'b')
title('Relative Initiation Densities Post-Osmoshock')
xlabel('Percent Water')
ylabel('Relative Initiation Density')
legend('RNAi','Control')