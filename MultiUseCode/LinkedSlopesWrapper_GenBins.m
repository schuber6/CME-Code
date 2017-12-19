function [LvZ,LsZ,LvI,LsI,LvF,LsZL]=LinkedSlopesWrapper_GenBins(NSTA,fg,zg,Nbins)

%Nbins=7;
DistCutoff=2;
CW=[0 0 1];
[Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTA(NSTA);
%[slopesINT,minint] = slope_finding(INTcell,fg,0);
[slopesINT,minint] = slope_finding(INTcell,3,0);
[slopesZ,~] = slope_finding_NoNorm(Zcell,3,0);
ListLinkedSlopes_4FrameWindow;
BinZIslopes_GenBins;
figure
PlotLinkedSlopes;
% figure
% subplot(1,2,1)
% scatter(LvZ,LsZ)
% subplot(1,2,2)
% scatter(LvI,LsI)