thresh=2000;
MinNum=3;

file='E:\CME Superfolder\CME Data\170919_SinlgeGFP_Less\040_BS.tif';
newfile='E:\CME Superfolder\CME Data\170919_SinlgeGFP_Less\040_Boxes_2000T_MN3_4000Colors.tif';
fxycfile='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS.mat';
load(fxycfile)
%[L,events]=ListAllSteps(Threshfxyc);
[events,As]=ListAllTracesThresholded(Threshfxyc,thresh,3);
for i=1:length(As)
    V=min([1 As(i)/4000]);
    Cs(i,:)=[V 1-V 0];
end
BoxEventsColors(file,newfile,events,Cs);
[Is,Bs]=ManualFitEvents(events,file);
Drops=TabulateManualFitChanges(events,Is);
xbins=-40000:1000:40000;
H=hist(Drops,xbins);
for i=1:length(H)
    Hs(i)=H(i)-H(length(H)+1-i);
end
%plot(xbins,Hs)
figure
hist(events(:,1),1:MaxFrameFXYC(Threshfxyc))