function [slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin)

slopeM=[];
slopeS=[];
for i=1:length(slopesM)
    for i2=1:length(slopesM(i).r2)
        if slopesM(i).r2(i2)>=Rmin && slopesS(i).r2(i2)>=Rmin
            slopeM=[slopeM slopesM(i).sl(i2)];
            slopeS=[slopeS slopesS(i).sl(i2)];
        end
    end
end