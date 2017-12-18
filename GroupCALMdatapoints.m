usedSH1=find(SH(:,1)==40);
usedSH1d12=find(SH(:,1)==40 & SH(:,6)<3);
usedSH2=find(SH(:,1)>40 & SH(:,1)<70); 
usedSH2d12=find(SH(:,1)>40 & SH(:,1)<70 & SH(:,6)<3); 
usedSH3=find(SH(:,1)>70);
usedSH3d12=find(SH(:,1)>70 & SH(:,6)<3);

usednSH1=find(nSH(:,1)==40);
%usednSH1d12=find(nSH(:,1)==40 & nSH(:,6)<3);
usednSH2=find(nSH(:,1)>40 & nSH(:,1)<70); 
%usednSH2d12=find(nSH(:,1)>40 & nSH(:,1)<70 & nSH(:,6)<3); 
usednSH3=find(nSH(:,1)>70);
%usednSH3d12=find(nSH(:,1)>70 & nSH(:,6)<3);

Mean1=mean(SH(usedSH1,2));
SD1=sqrt(var(SH(usedSH1,2)));
N1=length(usedSH1);

Mean1d12=mean(SH(usedSH1d12,2));
SD1d12=sqrt(var(SH(usedSH1d12,2)));
N1d12=length(usedSH1d12);

Mean2=mean(SH(usedSH2,2));
SD2=sqrt(var(SH(usedSH2,2)));
N2=length(usedSH2);

Mean2d12=mean(SH(usedSH2d12,2));
SD2d12=sqrt(var(SH(usedSH2d12,2)));
N2d12=length(usedSH2d12);

Mean3=mean(SH(usedSH3,2));
SD3=sqrt(var(SH(usedSH3,2)));
N3=length(usedSH3);

Mean3d12=mean(SH(usedSH3d12,2));
SD3d12=sqrt(var(SH(usedSH3d12,2)));
N3d12=length(usedSH3d12);

Mean1n=mean(nSH(usednSH1,2));
SD1n=sqrt(var(nSH(usednSH1,2)));
N1n=length(usednSH1);

%Mean1d12n=mean(nSH(usednSH1d12,2));
%SD1d12n=sqrt(var(nSH(usednSH1d12,2)));

Mean2n=mean(nSH(usednSH2,2));
SD2n=sqrt(var(nSH(usednSH2,2)));
N2n=length(usednSH2);

%Mean2d12n=mean(nSH(usednSH2d12,2));
%SD2d12n=sqrt(var(nSH(usednSH2d12,2)));

Mean3n=mean(nSH(usednSH3,2));
SD3n=sqrt(var(nSH(usednSH3,2)));
N3n=length(usednSH3);

%Mean3d12n=mean(nSH(usednSH3d12,2));
%SD3d12n=sqrt(var(nSH(usednSH3d12,2)));

subplot(2,2,1)
errorbar([40 60 80],[Mean1 Mean2 Mean3],[SD1 SD2 SD3],'r')
hold on
errorbar([40 60 80],[Mean1n Mean2n Mean3n],[SD1n SD2n SD3n],'b')
ylim([.9 1.6])
xlabel('Percent Water')
ylabel('Decrease in the Growth Rate Standard Deviation During Osmoshock')
title('With day 3, Standard Deviation error bars')

subplot(2,2,2)
errorbar([40 60 80],[Mean1d12 Mean2d12 Mean3d12],[SD1d12 SD2d12 SD3d12],'r')
hold on
errorbar([40 60 80],[Mean1n Mean2n Mean3n],[SD1n SD2n SD3n],'b')
ylim([.9 1.6])
% xlabel('Percent Water')
% ylabel('Decrease in the Growth Rate Standard Deviation During Osmoshock')
title('Without day 3, Standard Deviation error bars')

subplot(2,2,3)
errorbar([40 60 80],[Mean1 Mean2 Mean3],[SD1/sqrt(N1) SD2/sqrt(N2) SD3/sqrt(N3)],'r')
hold on
errorbar([40 60 80],[Mean1n Mean2n Mean3n],[SD1n/sqrt(N1n) SD2n/sqrt(N2n) SD3n/sqrt(N3n)],'b')
ylim([.9 1.6])
% xlabel('Percent Water')
% ylabel('Decrease in the Growth Rate Standard Deviation During Osmoshock')
title('With day 3, Standard Error of the mean error bars')

subplot(2,2,4)
errorbar([40 60 80],[Mean1d12 Mean2d12 Mean3d12],[SD1d12/sqrt(N1d12) SD2d12/sqrt(N2d12) SD3d12/sqrt(N3d12)],'r')
hold on
errorbar([40 60 80],[Mean1n Mean2n Mean3n],[SD1n/sqrt(N1n) SD2n/sqrt(N2n) SD3n/sqrt(N3n)],'b')
ylim([.9 1.6])
% xlabel('Percent Water')
% ylabel('Decrease in the Growth Rate Standard Deviation During Osmoshock')
title('Without day 3, Standard Error of the mean error bars')
