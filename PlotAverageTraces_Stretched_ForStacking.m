function LT=PlotAverageTraces_Stretched_ForStacking(fxycS,Pre)


Bins=40;
RatioL=cell(1,Bins);
AP2L=cell(1,Bins);
CLTAL=cell(1,Bins);
MasterThresh=400;
SlaveThresh=400;
RatioThresh=.5;
LTc=[];
for i=1:length(fxycS)
    if fxycS(i).class==3 && max(fxycS(i).int)>=MasterThresh && max(fxycS(i).Sint)>=SlaveThresh && median(fxycS(i).int./fxycS(i).Sint)>RatioThresh
        FM=length(fxycS(i).frame);
        AM=max(fxycS(i).int);
        CM=max(fxycS(i).Sint);
        LTc=[LTc fxycS(i).lt];
        for i2=1:length(fxycS(i).frame)
            A=fxycS(i).int(i2);
            C=fxycS(i).Sint(i2);
            B=ceil(i2/FM*Bins);
            
            if C~=0
                R=A/C;
                RatioL{B}=[RatioL{B} R];
            end
            AP2L{B}=[AP2L{B} A];
            CLTAL{B}=[CLTAL{B} C];
        end
    end
end

for i=1:Bins
    CM(i)=mean(CLTAL{i});
    AM(i)=mean(AP2L{i});
    RM(i)=mean(RatioL{i});
    FT(i)=i/Bins;
end
subplot(1,2,1)
if Pre
plot(FT,CM,'r','LineStyle','--')
hold on
plot(FT,AM,'g','LineStyle','--')
else
    plot(FT,CM,'r')
    hold on
    plot(FT,AM,'g')
end
title('Average GFP, RFP Traces')
ylabel('Fraction of Maximum Intensity')
xlabel('Fraction of Trace Completed')
subplot(1,2,2)
if Pre
    plot(FT,RM,'k','LineStyle','--')
else
plot(FT,RM,'k')
end
hold on
title('Average Ratio Trace')
ylabel('AP2:CLTA Ratio')
xlabel('Fraction of Trace Completed')
LT=median(LTc);