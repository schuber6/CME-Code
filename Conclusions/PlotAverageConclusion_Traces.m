function [AC,t,SDC,Nc,TCell,TF]=PlotAverageConclusion_Traces(FXYCMS,Tmast,MinLTF,FrameGap,AverageZeros)

NT=100;
MaxLTF=60;
[Nc,Fs,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,Inf,1);
MF=MaxFrameFXYCMS(FXYCMS_Sel);
ACell=cell(1,2*MF);
TCell={};
TF=[];
ind=1;
for i=1:length(Fs)
    fxyc=FXYCMS_Sel{i};
    if fxyc(1,4)==3
        I=find(fxyc(:,1)==Fs(i));
        if AverageZeros
            ZT=zeros(1,2*MF);
            for i2=1:length(fxyc(:,1))
                ZT(i2-I(1)+MF)=fxyc(i2,7);
            end
            for i2=1:length(ZT)
                ACell{i2}=[ACell{i2} ZT(i2)];
            end
        else
            for i2=1:length(fxyc(:,1))
                ACell{i2-I(1)+MF}=[ACell{i2-I(1)+MF} fxyc(i2,7)];
            end
        end
        TCell{ind}=fxyc(:,7);
        TF(ind)=I(1);
        ind=ind+1;
    end
end

for i=1:length(ACell)
    if isempty(ACell{i})
        ACell{i}=[0];
    end
end
AC=StatCell_Fancy(ACell,@mean);
AC=AC(MF-NT/2:MF+NT/2);
SDC=StatCell_Fancy(ACell,@StandardDeviation);
SDC=SDC(MF-NT/2:MF+NT/2);
t=(1:NT+1)*FrameGap;
