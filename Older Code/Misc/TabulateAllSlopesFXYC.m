function slopes=TabulateAllSlopesFXYC(Threshfxyc,FrameGap,Thresh)

INT=CreateIntensityCell(Threshfxyc);
F=CreateFrameCell(Threshfxyc);
slopesC = slope_finding(INT,FrameGap,Thresh);
slopes=[];
for i=1:length(slopesC)
    slopes=[slopes ; nonzeros(slopesC{i})];
end