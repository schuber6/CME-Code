function MSDifs=HistFirstFrameMSDif(fxycMS)

Ts=length(fxycMS(1,1,:));
MSDifs=[];
for i=1:Ts
    Mr=fxycMS(1,9,i)/max(fxycMS(:,9,i));
    Sr=fxycMS(1,6,i)/max(fxycMS(:,6,i));
    MSDifs=[MSDifs Mr-Sr];
end
xbins=-1:.05:1;
figure
hist(MSDifs,xbins)
xlim([-1 1])