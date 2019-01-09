function PlotAllPostOsmoSections(FXYCMS,OsmoF)
    
    Traces=FindAllMidOsmoTraces(FXYCMS,OsmoF);
    FSFig
    for i=1:length(Traces)
        fxyc=FXYCMS{Traces(i)};
        used=find(fxyc(:,1)>=OsmoF);
        plot(fxyc(used,6),'g')
        hold on
        plot(fxyc(used,7),'r')
    end
    
    