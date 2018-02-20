    [Traces,MIO,SIO]=FindAllMidOsmoTraces(FXYCMS,60);
    %[Traces,MIO,SIO]=FindAllPostOsmoTraces(FXYCMS,60);
    FSFig
    for i=1:MaxFrameFXYCMS(FXYCMS)
        [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,Traces,i);
        if ~isempty(MI)
            [slope(i), rsq(i)]=LinearSlopeandR2_0Intercept(MI,SI);
            N(i)=length(MI);
        else
            slope(i)=0;
            rsq(i)=0;
            N(i)=0;
        end
    end
    subplot(1,3,1)
    plot(slope)
    title('Master/Slave Slope (Of traces around at the time of osmoshock)')
    subplot(1,3,2)
    plot(rsq)
    title('R^2')
    subplot(1,3,3)
    plot(N)
    title('Number Points')
