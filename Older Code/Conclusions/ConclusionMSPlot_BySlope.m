function [Ncwt,Ncsi]=ConclusionMSPlot_BySlope(fileswt,filessi,Tmast,N)


FrameGap=2;
MaxFrame=151;
%Tmast=3000;
Tslave=0;
MinLTF=30/FrameGap;

for i0=1:length(fileswt)
    load(fileswt{i0});
    [Ncwt(i0),~,~,~,~,~,~,~,MSwt{i0}]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
    MSwt{i0}=MSwt{i0}/N;
end

for i0=1:length(filessi)
    load(filessi{i0});
    [Ncsi(i0),~,~,~,~,~,~,~,MSsi{i0}]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
    MSsi{i0}=MSsi{i0}/N;
end

MS=CombineCells(MSwt,{[]});
MS=CombineCells(MS,MSsi);

figure
BoxPlotCell(MS,@notBoxPlot);

