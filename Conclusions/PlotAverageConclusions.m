function [AC,t,SDC,Nc]=PlotAverageConclusions(FXYCMS,Tmast,MinLTF,FrameGap)

MaxLTF=60;
[Nc,Fs,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,MaxLTF);
ACell=cell(1,13);
for i=1:length(Fs)
    fxyc=FXYCMS_Sel{i};
    I=find(fxyc(:,1)==Fs(i));
    for i2=1:length(fxyc(:,1))
        ACell{i2-I(1)+7}=[ACell{i2-I(1)+7} fxyc(i2,7)];
    end
end
AC=StatCell_Fancy(ACell,@mean);
SDC=StatCell_Fancy(ACell,@StandardDeviation);
t=(1:13)*FrameGap;
