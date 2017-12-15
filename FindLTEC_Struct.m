function LTFEC=FindLTEC_Struct(fxyc_struct,framegap)

[C,L,T]=TranslateFXYCS(fxyc_struct);
ltf=PlotAverageLifetime_NoPlot(C,L,T,1,0);
LTFEC=ltf*framegap;
