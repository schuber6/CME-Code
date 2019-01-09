function [SumM,SumS]=PlotSumIntensity(FXYCMS)
    
    MF=MaxFrameFXYCMS(FXYCMS);
    SumS=zeros(1,MF);
    SumM=zeros(1,MF);
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        for i2=1:length(fxyc(:,1))
            SumM(fxyc(i2,1))=SumM(fxyc(i2,1))+fxyc(i2,6);
            SumS(fxyc(i2,1))=SumS(fxyc(i2,1))+fxyc(i2,7);
        end
    end
    
    [Ni,Nc]=CountInitiationsConclusions_ByFrame(FXYCMS,100,3000,3000);
    Ni=RollingWindowAverage(Ni,10,'After');
    
    figure
    subplot(1,2,1)
    plot(SumM/max(SumM))
    hold on
    plot(Ni/max(Ni))
    subplot(1,2,2)
    plot(SumS/max(SumS))
    hold on
    plot(Ni/max(Ni))