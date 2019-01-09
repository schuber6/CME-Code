function PlotRandomFXYCMSF(FXYCMS)

N=5;
    figure
for i=1:N^2


        R=ceil(rand*length(FXYCMS));


    subplot(N,N,i)
    Red=FXYCMS{R}(:,6);
    Green=FXYCMS{R}(:,7);
    Frames=FXYCMS{R}(:,1);
    plot(Frames,Green,'g')
    hold on
    plot(Frames,Red,'r')
    title(num2str(R))
%     figure(2)
%     subplot(N,N,i)
%     ScatterWithArrows(Red,Green);
%     xlabel('AP2 Intensity')
%     ylabel('CALM Intensity')
end