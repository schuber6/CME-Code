function IM=CoverEventsImage(IM,events)
%Draws boxes around events in tif, specified by fxy matrix



    A=IM;
    [Y,X]=size(A);
    B=double(A);
    used=find(events(:,1)==1);
    for i=1:length(used)
        x=round(events(used(i),2));
        y=round(events(used(i),3));
        if x~=0 && y~=0
            for xoff=-3:3
                for yoff=-3:3
                    if x+xoff>0 && x+xoff<=X && y+yoff>0 && y+yoff<=Y
                        B(y+yoff,x+xoff)=-1;

                    end
                end
            end
        end
    end
    
    IM=B;
