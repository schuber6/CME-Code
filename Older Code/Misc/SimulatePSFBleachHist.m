function data=SimulatePSFBleachHist

PSFSD=1;
trials=1000;
data=[];
IMdata=zeros(9);
for i=1:trials;
xt=rand+4;
yt=rand+4;
for ix=1:9
    for iy=1:9
        IM(iy,ix)=1000*exp(-(norm([xt-ix yt-iy]))^2/2);
    end
end
V=reshape(IM,[1 81]);
data=[data V];
IMdata=IMdata+IM;
end
figure
surf(IMdata)
figure
hist(data,100)
