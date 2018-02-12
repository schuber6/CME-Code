function [RatioL,AP2L,CLTAL]=PlotAverageRatioVSFrame(fxycS)

M=MaxFrameFXYCS(fxycS);
RatioL=cell(1,M);
AP2L=cell(1,M);
CLTAL=cell(1,M);
for i=1:length(fxycS)
    for i2=1:length(fxycS(i).frame)
        A=fxycS(i).int(i2);
        C=fxycS(i).Sint(i2);
        F=fxycS(i).frame(i2);
        if C~=0
        R=A/C;
        RatioL{F}=[RatioL{F} R];
        end
        
        
        AP2L{F}=[AP2L{F} A];
        CLTAL{F}=[CLTAL{F} C];
    end
end
for i=1:M
    RF(i)=median(RatioL{i});
    AF(i)=median(AP2L{i});
    CF(i)=median(CLTAL{i});
end
plot(RF*100,'k')
hold on
plot(CF,'r')
plot(AF,'g')