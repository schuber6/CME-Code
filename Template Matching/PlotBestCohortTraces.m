function PlotBestCohortTraces(FXYCMS,IndVect,LTvect,CohortEdges_InFrames)
    
        CE=CohortEdges_InFrames;
    cols=distinguishable_colors(length(CE)-1,[0 0 0]);
    events=[];
    Cs=[];
    Coh=zeros(1,length(FXYCMS));
    rsqAll=zeros(1,length(FXYCMS));
    Secs=zeros(1,length(FXYCMS));
    for Section=1:length(IndVect)
        inds=IndVect{Section};
        LTs=LTvect{Section};
        for i=1:length(inds)
            LT=LTs(i);
            Coh(inds(i))=0;
            for i2=1:length(CE)-1
                if LT>=CE(i2) && LT<CE(i2+1)
                    Coh(inds(i))=i2;
                    fxyc=FXYCMS{inds(i)};
                    [slope, rsq]=LinearSlopeandR2_0Intercept(fxyc(:,7).',fxyc(:,6).');
                    rsqAll(inds(i))=rsq;
                    Secs(inds(i))=Section;
                    break
                end
            end
        end
    end
    FSFig
    NC=length(CE)-1;
    for i=1:NC
        Count=0;
        for Sec=1:2
            used=find(Coh==i & Secs==Sec);
            Ru=rsqAll(used);
            Rsort=sort(Ru,'descend');
            
            for i2=1:2
                Count=Count+1;
                subplot(4,NC,(Count-1)*NC+i)
                I=find(rsqAll==Rsort(i2));
                fxyc=FXYCMS{I(1)};
                plot(fxyc(:,1),fxyc(:,6)/max(fxyc(:,6)),'g')
                hold on
                plot(fxyc(:,1),fxyc(:,7)/max(fxyc(:,7)),'r')
                [slope, rsq]=LinearSlopeandR2_0Intercept(fxyc(:,7).',fxyc(:,6).');
                title(strcat('slope=',num2str(slope),'rsq=',num2str(rsq),'(MA,MC)=',num2str(max(fxyc(:,6))),',',num2str(max(fxyc(:,7)))))
            end
        end
    end