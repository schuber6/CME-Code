%This is a cell that is very bright in the red channel, the power is turned
%very low so that the green channel should be dark, but you see a little
%bleed-through due to Ruby's excitation by the 488 laser.  By comparing the
%thresholded pixels in the red channel with the same pixels in the green
%channel, I found that the amount of Ruby signal you can see in the green
%channel is <6%
name='E:\CME Superfolder\CME Data\180109_BleedThrough\bleedupperbound001.tif';
F=length(imfinfo(name));
for i=1:F/2
    IMG=imread(name,'Index',2*i-1);
    IMR=imread(name,'Index',2*i);
    VG=double(reshape(IMG,[1 512*512]));
    VR=double(reshape(IMR,[1 512*512]));
    used=find(VR>=500);
    unused=find(VR<500);
    TR=VR(used);
    TG=VG(used);
    UTR=VR(unused);
    UTG=VG(unused);
    MD(i)=median(TG);
    MDu(i)=median(UTG);
    MDr(i)=median(TR);
    M(i)=mean(TG);
    Mu(i)=mean(UTG);
end
 figure
 plot(M,'r')
 hold on
 plot(Mu,'r--')
 plot(MD,'g')
 plot(MDu,'g--')
 plot(MDr/mean(MDr)*(mean(MD)-mean(MDu))+mean(MDu),'b')
% subplot(1,2,1)
% hexscatter(TG.',TR.')
% subplot(1,2,2)
% hexscatter(UTG.',UTR.')