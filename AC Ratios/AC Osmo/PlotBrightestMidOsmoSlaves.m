OsmoF=30;
OF=OsmoF;
[Traces,MIO,SIO]=FindAllMidOsmoTraces(FXYCMS,OsmoF);
%figure
%hist(SIO)
SS=sort(SIO);
brightest=SS(end-200:end);
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
    FadeCont(i)=QuantifyFades(Fs,SI,MI,OsmoF,'ACzsco');
    Ts(i)=T;
%     Decision=DetermineIfFades(Fs,SI,MI,OsmoF);
%     if Decision
%         events=[events ; [Fs Xs Ys]];
%         Faders=[Faders T];
%     end
end
OsmoF=60;
OF=OsmoF;
[Traces,MIO,SIO]=FindAllMidOsmoTraces(FXYCMS,OsmoF);
%figure
%hist(SIO)
SS=sort(SIO);
brightest=SS(end-200:end);
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
    Fade(i)=QuantifyFades(Fs,SI,MI,OsmoF,'ACzsco');
    Ts(i)=T;
%     Decision=DetermineIfFades(Fs,SI,MI,OsmoF);
%     if Decision
%         events=[events ; [Fs Xs Ys]];
%         Faders=[Faders T];
%     end
end
SFade=sort(Fade);
Best=find(SFade,20,'last');
file='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_CLCa.tif';
newfile=strcat(file(1:end-4),'FadersBox.tif');
%BoxEvents(file,newfile,events)
figure
for i=1:length(Best)
    subplot(4,5,i)
    Fi=find(Fade==SFade(Best(i)));
    BT(i)=Ts(Fi(1));
    T=BT(i);
    Fs=FXYCMS{T}(:,1);
    MI=FXYCMS{T}(:,6);
    SI=FXYCMS{T}(:,7);
    Oind=find(Fs>=OsmoF,1,'first');
    %movieG='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_AP2.tif';
    %movieR='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_CLCa.tif';
    %file='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_AP2.tif';
    %Kym=KymographTrace_WithBlueBar(fxy,movieG,movieR,T,5,'sum',60);
    plot(Fs,MI/MI(Oind),'g')
    hold on
    plot(Fs,SI/SI(Oind),'r')
    YL=ylim;
    line([OF OF],YL)
    title(num2str(SFade(Best(i))))
end
figure
HO=hist(Fade,-5:10);
HC=hist(FadeCont,-5:10);
plot(-5:10,HC,'g')
hold on
plot(-5:10,HO,'r')
xlim([1 10])
xlabel('Fade Test Statistic')
ylabel('Count')
legend('Control','Osmoshock')