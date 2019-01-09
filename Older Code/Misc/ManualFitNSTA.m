function [nstaF]=ManualFitNSTA(NSTA,movie,zstacks)

nstaF=NSTA;
h=waitbar(0,'Refitting Spots');
for i=1:length(NSTA)
    waitbar(i/length(NSTA))
    Bbacks=[];
    Bamps=[];
    Bfx=[];
    Bfy=[];
    Bsx=[];
    Bsy=[];
    Bsums=[];
    for i2=1:length(NSTA(i).frame)
        x=round(NSTA(i).xpos(i2));
        y=round(NSTA(i).ypos(i2));
        f=NSTA(i).frame(i2);
        stacks=(f-1)*zstacks+1:f*zstacks;
        backs=[];
        amps=[];
        fx=[];
        fy=[];
        sx=[];
        sy=[];
        sums=[];
        for i3=1:zstacks
            c=FitSlave5(stacks(i3),x,y,movie,0);
            backs=[backs  c(1)];
            amps=[amps c(2)];
            fx=[fx c(3)];
            fy=[fy c(4)];
            sx=[sx c(5)];
            sy=[sy c(6)];
            sums=[sums c(8)];
        end
        Bbacks=[Bbacks ; backs];
        Bamps=[Bamps ; amps];
        Bfx=[Bfx ; fx];
        Bfy=[Bfy ; fy];
        Bsx=[Bsx ; sx];
        Bsy=[Bsy ; sy];
        Bsums=[Bsums ; sums];
    end
    nstaF(i).backs=Bbacks;
    nstaF(i).amps=Bamps;
    nstaF(i).fx=Bfx;
    nstaF(i).fy=Bfy;
    nstaF(i).sx=Bsx;
    nstaF(i).sy=Bsy;
    nstaF(i).RawSums=Bsums;
end
close(h)