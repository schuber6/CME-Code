function Dists=FindDistanceToNearestSpot(Xs,Ys)
    
    for i=1:length(Xs)
        Mi=100;
        x=Xs(i);
        y=Ys(i);
        for i2=1:length(Xs)
            if abs(x-Xs(i2))<Mi && abs(y-Ys(i2))<Mi && i~=i2
                D=norm([x-Xs(i2) y-Ys(i2)]);
                if D<Mi
                    Mi=D;
                end
            end
        end
        Dists(i)=Mi;
    end