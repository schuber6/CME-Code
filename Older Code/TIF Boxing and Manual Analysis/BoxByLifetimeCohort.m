function BoxByLifetimeCohort(FXYCMS,IndVect,LTvect,oldfile,newfile,CohortEdges_InFrames)
    
    CE=CohortEdges_InFrames;
    cols=distinguishable_colors(length(CE)-1,[0 0 0]);
    events=[];
    Cs=[];
    for Section=1:length(IndVect)
        inds=IndVect{Section};
        LTs=LTvect{Section};
        for i=1:length(inds)
            LT=LTs(i);
            Coh=0;
            for i2=1:length(CE)-1
                if LT>=CE(i2) && LT<CE(i2+1)
                    Coh=i2;
                    break
                end
            end
            if Coh~=0
                C=cols(Coh,:);
                fxyc=FXYCMS{inds(i)};
                for i2=1:length(fxyc(:,1))
                    F=fxyc(i2,1);
                    X=fxyc(i2,2);
                    Y=fxyc(i2,3);
                    events=[events ; [F X Y]];
                    Cs=[Cs ; C];
                end
            end
        end
    end
    BoxEventsColors(oldfile,newfile,events,Cs)