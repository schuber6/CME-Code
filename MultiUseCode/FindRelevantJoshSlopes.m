function [Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc)
%Finds all josh slope directly before and after osmoshock for a given trace
%matrix--for osmoshock at 5 min: Before is 1-4min, After is 6-9 min

FrameGap=3;

FrameBins=5;

INT=CreateIntensityCell(Threshfxyc);
F=CreateFrameCell(Threshfxyc);
slopes = slope_finding(INT,FrameGap,400);
first=1;
last=max(max(Threshfxyc(:,1,:)));
JOSH=CombineSlopes(slopes);
JOSHF=CombineSlopes(F);

clear f sd

startB=OsmoT/FrameGap/5;
finishB=startB*4;

startA=startB*6;
finishA=startB*9;


    [Jb,~]=RestrictJOSHSlopesWsd(JOSH,JOSHF,startB,finishB);
    [Ja,~]=RestrictJOSHSlopesWsd(JOSH,JOSHF,startA,finishA);
    Jb=nonzeros(Jb).';
    Ja=nonzeros(Ja).';
