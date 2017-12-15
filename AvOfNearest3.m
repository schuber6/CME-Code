function Z=AvOfNearest3(x,y,z,spacing)

Far=40;

h=waitbar(0,'Finding Nearest');
ixt=1:spacing:512;
iyt=1:spacing:512;
Z=zeros(length(ixt),length(iyt));
for ix=1:length(ixt)
    waitbar(ix/512)
    for iy=1:length(iyt)
        Nearest=[1 1 1]*sqrt(2*Far^2);
        Ni=[0 0 0];
        Nz=[0 0 0];
        for i=1:length(x)
            dx=abs(ixt(ix)-x(i));
            dy=abs(iyt(iy)-y(i));
            if dx<=Far && dy<=Far
                d=norm([dx dy]);
                M=find(Nearest==max(Nearest));
                if d<max(Nearest)
                    Nearest(M(1))=d;
                    Ni(M(1))=i;
                    Nz(M(1))=z(i);
                end
            end
        end
        if min(Ni)>0
            Z(ix,iy)=mean(Nz);
        end
    end
end
close(h)