function [Hm,Hs,mbins]=SlopeAnalysis(file)

load(file)
if isempty(FXYCMS)
    slopeM=[];
    slopeS=[];
else
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,3);
[slopesM] = my_slope_finding(IntCellM,2,0);
[slopesS] = my_slope_finding(IntCellS,2,0);
[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,10^(-3));
end

[Hm,mbins]=hist(slopeM,-.1:.002:.1);
[Hs,sbins]=hist(slopeS,mbins);