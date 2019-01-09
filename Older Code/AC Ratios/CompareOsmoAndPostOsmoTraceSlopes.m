    [TracesO,MIO,SIO]=FindAllMidOsmoTraces(FXYCMS,60);
    [TracesP,MIO,SIO]=FindAllPostOsmoTraces(FXYCMS,60);
    FSFig
    for i=1:MaxFrameFXYCMS(FXYCMS)
        [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,TracesO,i);
        if ~isempty(MI)
            [slopeO(i), rsqO(i)]=LinearSlopeandR2_0Intercept(SI,MI);
            NO(i)=length(MI);
        else
            slopeO(i)=0;
            rsqO(i)=0;
            NO(i)=0;
        end
    end
    for i=1:MaxFrameFXYCMS(FXYCMS)
        [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,TracesP,i);
        if ~isempty(MI)
            [slopeP(i), rsqP(i)]=LinearSlopeandR2_0Intercept(SI,MI);
            NP(i)=length(MI);
        else
            slopeP(i)=0;
            rsqP(i)=0;
            NP(i)=0;
        end
    end
     %subplot(1,2,1)
     used=find(NP>=50);
    plot(used,slopeP(used),'r')
    hold on
    plot(slopeO,'g')
    title('Master/Slave Slope')
    legend('Traces that begin after Osmoshock','Traces that exist at the time of Osmoshock')
%     subplot(1,3,2)
%     plot(rsq)
%     title('R^2')
%     subplot(1,2,2)
%     plot(NP,'r')
%     hold on
%     plot(NO,'g')
%     title('Number Points')
