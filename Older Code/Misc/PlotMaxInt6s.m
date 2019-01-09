function P95=PlotMaxInt6s(fxyc,C,FrameGap)

M=zeros(1,length(C));
M6=zeros(1,length(C));
N6f=floor(6/FrameGap)+1;
C6f=[];
for i=1:N6f
C6f=[C6f i];
end
for i=1:length(C)
    M(i)=max(fxyc(:,5,C(i)));
    M6(i)=max(fxyc(C6f,5,C(i)));
end
xbins=1:50;
xbins=xbins*50;
H6=hist(M6,xbins);
H=hist(M,xbins);
plot(xbins,H6,'r')
hold on
%plot(xbins,H,'b')
P95=prctile(M6,95);
    