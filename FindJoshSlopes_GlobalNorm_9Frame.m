function [J,SD]=FindJoshSlopes_GlobalNorm_9Frame(Threshfxyc)
%Finds all josh slopes and standard deviation (uses every cat but 4)

FrameGap=3;

FrameBins=5;

INT=CreateIntensityCellOnly9Frames(Threshfxyc);
F=CreateFrameCell(Threshfxyc);
slopes = slope_finding_GlobalMaxMedianNorm(INT,FrameGap,400);
first=1;
last=max(max(Threshfxyc(:,1,:)));
J=CombineSlopes(slopes);
J=nonzeros(J).';
SD=sqrt(var(J));