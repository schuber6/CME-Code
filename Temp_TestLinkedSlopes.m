fg=3;
for Window=1:2
        WindowSize=100;
        i0=1;
        NSTA=NSTAf;
        if Window==1
            W2=Window;
            C=[0 1 0];
        else
            W2=2.5;
            C=[1 0 0];
        end
        
        beg=(W2-1)*WindowSize;
        fin=W2*WindowSize;
%         beg=1;
%         fin=maxframeNSTA(NSTA);
        
        [LsZL,xbins]=LinkedSlopesWrapper_Range_NoPlot(NSTA,beg,fin,3);
        subplot(2,4,i0)
        PlotLiftingGroups(LsZL,xbins,C)
        hold on
        
    end