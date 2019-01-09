function PlotAverageAC_FXYCMS_Func(FXYCMS,newfig,cola,colc)

MF=MaxFrameFXYCMS(FXYCMS);
ACell=cell(1,MF);
CCell=cell(1,MF);
ACCell=cell(1,MF);
for i=1:length(FXYCMS)
    for i2=1:length(FXYCMS{i}(:,1))
        A=FXYCMS{i}(i2,6);
        C=FXYCMS{i}(i2,7);
        if A>5000 && C>5000
            F=FXYCMS{i}(i2,1);
            ACell{F}=[ACell{F} A];
            CCell{F}=[CCell{F} C];
            ACCell{F}=[ACCell{F} log(A/C)];
        end
    end
end

for i=1:MF
    MA(i)=mean(ACell{i});
    MC(i)=mean(CCell{i});
    MAC(i)=mean(ACCell{i});
    S(i)=length(ACell{i});
end
if newfig
FSFig()
end
subplot(1,3,1)
plot(MA/mean(MA(1:10)),cola)
hold on
plot(MC/mean(MC(1:10)),colc)
legend('Adaptor','Clathrin')
title('Mean Intensity')
subplot(1,3,2)
plot(MAC-mean(MAC(1:10)),cola)
hold on
title('Log A:C Ratio')
subplot(1,3,3)
plot(S,cola)
hold on
title('Number of spots per frame')
