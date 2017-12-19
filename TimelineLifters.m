function [Lt,Ft,St]=TimelineLifters(Lifters,Flat,Sinkers,NSTA,Smoothing,inds)

M=maxframeNSTA(NSTA);
Lt=zeros(1,M);
Ft=Lt;
St=Ft;
for i=1:length(Lifters)
    Fr=max(NSTA(inds(Lifters(i))).frame);
    Lt(Fr)=Lt(Fr)+1;
end
for i=1:length(Flat)
    Fr=max(NSTA(inds(Flat(i))).frame);
    Ft(Fr)=Ft(Fr)+1;
end
for i=1:length(Sinkers)
    Fr=max(NSTA(inds(Sinkers(i))).frame);
    St(Fr)=St(Fr)+1;
end
for i=1:M-Smoothing+1
    Lt(i)=sum(Lt(i:i+Smoothing-1));
    St(i)=sum(St(i:i+Smoothing-1));
    Ft(i)=sum(Ft(i:i+Smoothing-1));
end
Norm=Lt+St+Ft;
Ltn=Lt./Norm;
Stn=St./Norm;
Ftn=Ft./Norm;

figure
plot(Lt,'b')
hold on
plot(Ft,'g')
plot(St,'r')
title(strcat('# per ',num2str(Smoothing),' Frames'))
figure
plot(Ltn,'b')
hold on
plot(Ftn,'g')
plot(Stn,'r')
title('Fraction of Concurrent Conclusion Events')