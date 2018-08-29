figure
for i=1:length(FXYCMS_Good{5})
    subplot(2,2,i)
    fxyc=FXYCMS_Good{5}{i};
    t=(1:length(fxyc(:,1)))*2;
    plot(t,fxyc(:,6),'r')
    hold on
    plot(t,fxyc(:,7),'g')
    legend('Clathrin','CALM')
end