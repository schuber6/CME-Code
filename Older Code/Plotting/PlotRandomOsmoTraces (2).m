function Ts=PlotRandomOsmoTraces(FXYCMS,MinL,MinI,OFrame)
    
    FSFig
    sample=9;
    NT=length(FXYCMS);
    Ts=[];
    for i=1:sample
        subplot(3,3,i)
        found=false;
        while ~found
            T=ceil(NT*rand);
            fxyc=FXYCMS{T};
            if length(fxyc(:,1))>=MinL && max(fxyc(:,6))>=MinI && max(fxyc(:,7))>=MinI && ismember(OFrame,fxyc(:,1))
                found=true;
            end
                
        end
        pre=find(fxyc(:,1)<OFrame);
%         plot(fxyc(:,1)*5,fxyc(:,6)/mean(fxyc(pre,6)),'g')
%         hold on
%         plot(fxyc(:,1)*5,fxyc(:,7)/mean(fxyc(pre,7)),'r')
                plot(fxyc(:,1)*5,fxyc(:,6),'g')
        hold on
        plot(fxyc(:,1)*5,fxyc(:,7),'r')
        YL=ylim;
        line([OFrame OFrame]*5,YL,'Color','b')
        Ts=[Ts T];
    end