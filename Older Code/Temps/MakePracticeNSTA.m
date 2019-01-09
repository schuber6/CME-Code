function [NSTA_pracm,NSTA_pracs]=MakePracticeNSTA(NSTA)
%Make practice NSTAs to test LinkMS_3dt code

for i=1:10
    for i2=1:5
        r1=ceil(rand*10);
        r2=ceil(rand*5);
        r3=ceil(rand*10);
        r4=ceil(rand*5);
        NSTA_pracm(i).frame(i2)=NSTA(r1).frame(r2);
        NSTA_pracs(i).frame(i2)=NSTA(r3).frame(r4);
        NSTA_pracm(i).xpos(i2)=NSTA(r1).xpos(r2)+(rand-.5)*.5;
        NSTA_pracs(i).xpos(i2)=NSTA(r3).xpos(r4)+(rand-.5)*.5;
        NSTA_pracm(i).ypos(i2)=NSTA(r1).ypos(r2)+(rand-.5)*.5;
        NSTA_pracs(i).ypos(i2)=NSTA(r3).ypos(r4)+(rand-.5)*.5;
        NSTA_pracm(i).int(i2)=NSTA(r1).int(r2)+(rand-.5)*.5;
        NSTA_pracs(i).int(i2)=NSTA(r3).int(r4)+(rand-.5)*.5;
        NSTA_pracm(i).st(i2)=NSTA(r1).st(r2)+(rand-.5)*.5;
        NSTA_pracs(i).st(i2)=NSTA(r3).st(r4)+(rand-.5)*.5;
    end
    NSTA_pracm(i).class=0;
    NSTA_pracs(i).class=0;
end