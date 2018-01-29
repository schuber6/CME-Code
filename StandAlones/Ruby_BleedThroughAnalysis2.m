%This was a movie with significant GFP signal, but also very strong Ruby
%signal.  By thresholding the cell and thresholding out any pits visible in
%the GFP channel, I found a cytosolic signal.  By assuming that all
%photobleaching happens in the Ruby channel, I was able to compare the
%drops in signal and determine the bleedthrough of the Ruby signal into the
%green channel "B".  It came out to be ~4%, matching the <~6% value from
%bleedupperbound001.tif
name='E:\CME Superfolder\CME Data\180109_BleedThrough\bleedupperbound.tif';
F=length(imfinfo(name));
for i=1:F/2
IMG=imread(name,'Index',2*i-1);
IMR=imread(name,'Index',2*i);
VG=double(reshape(IMG,[1 512*512]));
VR=double(reshape(IMR,[1 512*512]));
used=find(VR>=1600 & VG<900);
unused=find(VR<1600 & VG<900);
TR=VR(used);
TG=VG(used);
UTR=VR(unused);
UTG=VG(unused);
MD(i)=median(TG);
MDu(i)=median(UTG);
MDr(i)=median(TR);
MDru(i)=median(UTR);
M(i)=mean(TG);
Mu(i)=mean(UTG);
Mr(i)=mean(TR);
Mru(i)=mean(UTR);
end
%Bm=1/(mean(MDr)-mean(MDru))*(mean(MD)-mean(MDu))
%B1=1/(MDr(1)-MDru(1))*(MD(1)-MDu(1))
B=(MD(1)-MD(end))/(MDr(1)-MDr(end))
figure

 plot(MD,'g')
 hold on
 plot(MDu,'g--')
 plot((MDr-mean(MDru))/(mean(MDr)-mean(MDru))*(mean(MD)-mean(MDu))+mean(MDu),'b')
  figure
 plot(M,'r')
 hold on
 plot(Mu,'r--')

 plot((Mr-mean(Mru))/(Mr(1)-Mru(1))*(M(1)-Mu(1))+mean(Mu),'b')
% subplot(1,2,1)
% hexscatter(TG.',TR.')
% subplot(1,2,2)
% hexscatter(UTG.',UTR.')

