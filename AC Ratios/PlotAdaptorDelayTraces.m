[Traces,MIO,SIO]=FindAllBrightTraces(FXYCMS);
%figure
%hist(SIO)
SS=sort(SIO);
brightest=SS(end-1000:end);
events=[];
Faders=[];
for i=1:length(brightest)
%    subplot(4,5,i)
    SInd=find(SIO==brightest(i));
    T=Traces(SInd(1));
    Fs=FXYCMS{T}(:,1);
    SI=FXYCMS{T}(:,7);
    MI=FXYCMS{T}(:,6);
    Xs=FXYCMS{T}(:,2);
    Ys=FXYCMS{T}(:,3);
    used=find(SI>0 & MI>0);
    MI=MI(used);
    SI=SI(used);
    Fs=Fs(used);
    Xs=Xs(used);
    Ys=Ys(used);
    Fade(i)=QuantifyAdaptorDelay(SI,MI);
    Ts(i)=T;
%     Decision=DetermineIfFades(Fs,SI,MI,OsmoF);
%     if Decision
%         events=[events ; [Fs Xs Ys]];
%         Faders=[Faders T];
%     end
end
SFade=sort(Fade);
Best=find(SFade,20,'last');

figure
for i=1:length(Best)
    subplot(4,5,i)
    Fi=find(Fade==SFade(Best(i)));
    BT(i)=Ts(Fi(1));
    T=BT(i);
    Fs=FXYCMS{T}(:,1);
    MI=FXYCMS{T}(:,6);
    SI=FXYCMS{T}(:,7);

    plot(Fs,MI/max(MI),'g')
    hold on
    plot(Fs,SI/max(SI),'r')
    YL=ylim;

    title(num2str(SFade(Best(i))))
end