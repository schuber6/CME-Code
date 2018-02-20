MF=MaxFrameFXYCMS(FXYCMS);
ACell=cell(1,MF);
CCell=cell(1,MF);
ACCell=cell(1,MF);
for i=1:length(FXYCMS)
    for i2=1:length(FXYCMS{i}(:,1))
        A=FXYCMS{i}(i2,6);
        C=FXYCMS{i}(i2,7);
        if A>0 && C>0
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
FSFig()
subplot(1,3,1)
plot(MA,'g')
hold on
plot(MC,'r')
legend('Adaptor','Clathrin')
title('Mean Intensity')
subplot(1,3,2)
plot(MAC)
title('Log A:C Ratio')
subplot(1,3,3)
plot(S)
title('Number of spots per frame')

