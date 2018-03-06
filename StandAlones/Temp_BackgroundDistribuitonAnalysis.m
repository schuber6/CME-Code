movie='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_CLCa_InsideCrop.tif';

figure
xbins=0:10:2000;

i=55;
IM=imread(movie,'Index',i);
[A,B]=size(IM);
VIM=double(reshape(IM,[1 A*B]));
BottomB=prctile(VIM,75);
used=find(VIM<=BottomB);
BackB=VIM(used);
xbinsB=0:10:BottomB;
Bef=hist(BackB,xbinsB);


i=70;
IM=imread(movie,'Index',i);
[A,B]=size(IM);
VIM=double(reshape(IM,[1 A*B]));
BottomA=prctile(VIM,75);
used=find(VIM<=BottomA);
BackA=VIM(used);
xbinsA=0:10:BottomA;
Aft=hist(BackA,xbinsA);

plot(xbinsB(2:end-1),Bef(2:end-1),'g')
hold on
plot(xbinsA(2:end-1),Aft(2:end-1),'r')
%Bg=Bef(2:60);
%[A,x0,s]=FitAndPlotGaussian(xbins(3:40),Bef(3:40));
MeS=mean(BackB)-mean(BackA);
VarS=var(BackB)-var(BackA);

for i=1:length(BackA)
    R = normrnd(MeS,sqrt(VarS));
    BackANoise(i)=BackA(i)+R;
end
AftNoise=hist(BackANoise,xbinsB);
plot(xbinsB(2:end-1),AftNoise(2:end-1),'b')