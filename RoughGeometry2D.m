function [Volume,SA]=RoughGeometry2D(VT)

planespacing=.4/.7;
pixelspacing=.16;
Volume=sum(VT);
SA=VT(1)+VT(length(VT));