function [J,SD]=FindJoshSlopes(Threshfxyc)
%Finds all josh slopes and standard deviation (uses every cat but 4)

FrameGap=3;

FrameBins=5;

INT=CreateIntensityCellAllBut4s(Threshfxyc);
F=CreateFrameCell(Threshfxyc);
slopes = slope_finding(INT,FrameGap,400);
first=1;
last=max(max(Threshfxyc(:,1,:)));
J=CombineSlopes(slopes);
J=nonzeros(J).';
SD=sqrt(var(J));