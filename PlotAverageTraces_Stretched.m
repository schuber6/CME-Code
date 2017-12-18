function PlotAverageTraces_Stretched(fxycS)


Bins=40;
RatioL=cell(1,Bins);
AP2L=cell(1,Bins);
CLTAL=cell(1,Bins);
for i=1:length(fxycS)
    if fxycS(i).class==3
        FM=length(fxycS(i).frame);
        AM=max(fxycS(i).int);
        CM=max(fxycS(i).Sint);
        for i2=1:length(fxycS(i).frame)
            A=fxycS(i).int(i2);
            C=fxycS(i).Sint(i2);
            B=ceil(i2/FM*Bins);
            if C~=0
                R=A/C;
                RatioL{B}=[RatioL{B} R];
            end
            AP2L{B}=[AP2L{B} A/AM];
            CLTAL{B}=[CLTAL{B} C/CM];
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
plot(FT,CM,'r')
hold on
plot(FT,AM,'g')
title('Average GFP, RFP Traces')
ylabel('Fraction of Maximum Intensity')
xlabel('Fraction of Trace Completed')
subplot(1,2,2)
plot(FT,RM,'k')
hold on
title('Average Ratio Trace')
ylabel('AP2:CLTA Ratio')
xlabel('Fraction of Trace Completed')
