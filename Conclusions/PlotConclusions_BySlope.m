function [X,Y]=PlotConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,AvWindow,Plot)

[Nc,Fs]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
MF=MaxFrameFXYCMS(FXYCMS);
X=(1:AvWindow:MF)*FrameGap;
Y=hist(Fs,X/FrameGap);

if Plot
    plot(X,Y)
    hold on
end
