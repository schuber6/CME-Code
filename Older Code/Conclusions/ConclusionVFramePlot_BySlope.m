function ConclusionVFramePlot_BySlope(fileswt,filessi,Area_WT,Area_SI)

FrameGap=2;
MaxFrame=151;
Tmast=3000;
Tslave=0;
AvWindow=30;
MinLTF=30/FrameGap;

for i0=1:length(fileswt)
    load(fileswt{i0});
    [X,Ywt{i0}]=PlotConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,AvWindow,0);
    Ywt{i0}=Ywt{i0}/Area_WT(i0);
end
YwtM=Ywt{1};
num=1;
for i=2:length(fileswt)
YwtM=(Ywt{i}+YwtM);
num=num+1;
end
YwtM=YwtM/num;

for i0=1:length(filessi)
    load(filessi{i0});
    [X,Ysi{i0}]=PlotConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,AvWindow,0);
    Ysi{i0}=Ysi{i0}/Area_SI(i0);
end

YsiM=Ysi{1};
num=1;
for i=2:length(filessi)
    YsiM=(Ysi{i}+YsiM);
    num=num+1;
end
YsiM=YsiM/num;


% figure
% bar([Niwt.' Ncwt.']/5)
% figure
plot(X(2:end-1),YsiM(2:end-1),'b')
hold on
plot(X(2:end-1),YwtM(2:end-1),'g')
%L={'0-45s Pits','45-90s Pits','90-135s Pits','Stalled Structures'};
%legend(fliplr(Obj),fliplr(L));
ylabel('Internalizations/um^2/min')
%ylim([0 1])