function MSDifs=HistFirstFramesMSDif(fxycMS,N)

Ts=length(fxycMS(1,1,:));
MSDifs=[];
for i=1:Ts
    used=find(fxycMS(:,1,i));
    if length(used)>=N
        Mr=[];
        Sr=[];
    for i2=1:N
        Mr=[Mr fxycMS(i2,9,i)/max(fxycMS(:,9,i))];
        Sr=[Sr fxycMS(i2,6,i)/max(fxycMS(:,6,i))];
    
    end
    MSDifs=[MSDifs mean(Mr)-mean(Sr)];
    end
end
xbins=-1:.05:1;
figure
hist(MSDifs,xbins)
xlim([-1 1])