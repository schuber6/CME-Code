function PlotLinkedRatios_Ranges(fxycS)


Secs=5;
M=MaxFrameFXYCS(fxycS);
Size=floor(M/Secs);
for i=1:Secs
    figure
    Start=Size*(i-1);
    Fin=Size*i;
    [BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatiosRange(fxycS,Start,Fin);
    PlotLinkedSlopesF_2Color_WRatios(LsI,BMasterV,BSlaveV,BRatio);
end