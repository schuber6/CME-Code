function ScatterRandomOsmoTraces(FXYCMS,MinL,MinI,OFrame)
    
    FSFig
    sample=9;
    NT=length(FXYCMS);
    for i=1:sample
        subplot(3,3,i)
        found=false;
        while ~found
            T=ceil(NT*rand);
            fxyc=FXYCMS{T};
            if length(fxyc(:,1))>=MinL && max(fxyc(:,6))>=MinI && max(fxyc(:,7))>=MinI && ismember(OFrame-1,fxyc(:,1)) && ismember(OFrame+1,fxyc(:,1))
                found=true;
            end
                
        end
        pre=find(fxyc(:,1)<OFrame);
        post=find(fxyc(:,1)>=OFrame);
        [X,Y,u,v]=ScatterWithArrows_Color(fxyc(pre,6),fxyc(pre,7),[0 1 0]);
     
        [X,Y,u,v]=ScatterWithArrows_Color(fxyc(post,6),fxyc(post,7),[1 0 0]);
        xlabel('Adaptor Intensity')
        ylabel('Clathrin Intensity')
    end

