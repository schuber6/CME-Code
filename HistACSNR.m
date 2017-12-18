function [MA,Mc,MSNR,SA,Sc,SSNR,N]=HistACSNR(tracks)

A=[];
c=[];
SNR=[];
for i=1:length(tracks)
    A=[A tracks(i).A(1)];
    c=[c tracks(i).c(1)];
    SNR=[SNR tracks(i).A(1)/tracks(i).c(1)];
end
figure
hist(A,100)
figure
hist(c,100)
figure
hist(SNR,100)
MA=mean(A);
Mc=mean(c);
MSNR=mean(SNR);
SA=sqrt(var(A));
Sc=sqrt(var(c));
SSNR=sqrt(var(SNR));
N=length(tracks);