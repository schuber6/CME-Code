function Pos=RandomCirclePoint(Radius)

found=0;
while ~found
    X=rand*2-1;
    Y=rand*2-1;
    if sqrt(X^2+Y^2)<=1
        Pos=[X*Radius Y*Radius];
        found=1;
    end
end