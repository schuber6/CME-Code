% file='Z:\Scott\TIRF SIM\Control CALM Clathrin 4\FullPit2.tif';
% frames=1:12;
file='Z:\Scott\TIRF SIM\Control CALM Clathrin 4\FullPit.tif';
frames=15:32;
nbins=50;
figure(1)
for i0=1:length(frames)
    i=frames(i0);
    subplot(3,length(frames),i0)
    IMG{1}=imread(file,'Index',i);
    IM=IMG{1};
    imshow(IM,[0 max(max(IM))])
    hold on
    title(strcat('Frame ',num2str(i0)))
    [AC,SmallAC]=Autocorrellation(IM,50);
    subplot(3,length(frames),i0+length(frames))
    imagesc(SmallAC)
    title('AC')
    subplot(3,length(frames),i0+length(frames)*2)
    [xs,ys]=RadialDistancePlot(SmallAC,nbins);
    ys=ys/max(ys); %(ys-min(ys))/(max(ys)-min(ys));
    plot(xs*40,ys)
    xlim([0 200])
    hold on
    xq=0:max(xs);
    yi=interp1(xs,ys,xq);
    [xL,xR]=FindFWHMBoundaries(yi,0);
    F(i0)=(xR-1)*80;
    FWHMx=strcat('FWHM = ',num2str((xR-1)*80),' nm');
    line([0 xR-1]*40,[.5 .5],'LineStyle','--')
end
figure(2)
plot(F)
xlabel('Frame')
ylabel('AC Width')