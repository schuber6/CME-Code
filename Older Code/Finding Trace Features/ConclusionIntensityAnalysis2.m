[Inits,Concs]=InitiationConclusionIndices_FXYCMS(FXYCMS);

[ConcsMI,ConcsSI,MI,SI,ConcsLT]=TabulateConclusionIntensity(Inits,Concs,FXYCMS);

Before=1:60;
After=61:120;
BM=[];
BS=[];
AM=[];
AS=[];
for i=Before
    BM=[BM ConcsMI{i}];
    BS=[BS ConcsSI{i}];
end
for i=After
    AM=[AM ConcsMI{i}];
    AS=[AS ConcsSI{i}];
end
% subplot(2,2,1)
% hist(BM,100)
% subplot(2,2,2)
% hist(BS,100)
% subplot(2,2,3)
% hist(AM,100)
% subplot(2,2,4)
% hist(AS,100)
xbins=0:600:30000;
figure
subplot(1,2,1)
HBM=hist(BM,xbins);
HBS=hist(BS,xbins);
plot(HBM,xbins,'g')
hold on
plot(HBS,xbins,'r')
title('Before Osmoshock')
xlabel('Count')
ylabel('Intensity')
legend('CALM','Clathrin')



subplot(1,2,2)
HAM=hist(AM,xbins);
HAS=hist(AS,xbins);
plot(HAM,xbins,'g')
hold on
plot(HAS,xbins,'r')
title('After Osmoshock')
xlabel('Count')
ylabel('Intensity')
legend('CALM','Clathrin')

