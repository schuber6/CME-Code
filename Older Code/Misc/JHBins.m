function xbins=JHBins(N,abs)

for i=1:N
    xbins(i)=-1*abs+2*abs*(i-1)/(N-1);
end
