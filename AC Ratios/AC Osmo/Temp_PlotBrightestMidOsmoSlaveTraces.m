[Traces,MIO,SIO]=FindAllMidOsmoTraces(FXYCMS,60);
%figure
%hist(SIO)
SS=sort(SIO);
brightest=SS(end-25:end);
figure
for i=1:length(brightest)
    subplot(4,5,i)
    SInd=find(SIO==brightest(i));
    T=Traces(SInd(1));
    Fs=FXYCMS{T}(:,1);
    SI=FXYCMS{T}(:,7);
    MI=FXYCMS{T}(:,6);
    used=find(SI>0 & MI>0);
    MI=MI(used);
    SI=SI(used);
    Fs=Fs(used);
    plot(Fs*5,SI,'r')
    hold on
    %xlim([250 350])
    %subplot(1,2,2)
    plot(Fs*5,MI/max(MI)*max(SI),'g')%log(MI./SI))
    hold on
     xlim([250 400])
end