function Pos=RandomPartialSpherePoint(Radius,maxphi)

theta=2*pi*rand;
found=0;
while ~found
    phi=acos(rand*2-1);
    if phi<=maxphi
        found=1;
    end
end
Pos=[Radius*sin(phi)*cos(theta) Radius*sin(phi)*sin(theta) Radius*cos(phi)];
