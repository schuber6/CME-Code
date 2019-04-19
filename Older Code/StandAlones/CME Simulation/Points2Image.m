function IM=Points2Image(Pos,ImWidth,TIRFDecayL,PixelWidth)

IM=zeros(ImWidth);
Middle=ceil(ImWidth/2);
MaxBrightness=1;
for i=1:length(Pos(:,1))
    Brightness=MaxBrightness*exp((-1)*Pos(i,3)/TIRFDecayL);
    pxx=round(Pos(i,1)/PixelWidth+Middle);
    pxy=round(Pos(i,2)/PixelWidth+Middle);
    IM(pxx,pxy)=IM(pxx,pxy)+Brightness;
end