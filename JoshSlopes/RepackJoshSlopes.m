function [FXYCMS]=RepackJoshSlopes(slopesM,slopesS,Is,FXYCMS)

slopeM=[];
slopeS=[];
for i=1:length(slopesM)
    for i2=1:length(slopesM(i).r2)
        FXYCMS{Is(i)}(i2,8)=slopesM(i).sl(i2);
        FXYCMS{Is(i)}(i2,9)=slopesS(i).sl(i2);
        FXYCMS{Is(i)}(i2,10)=slopesM(i).r2(i2);
        FXYCMS{Is(i)}(i2,11)=slopesS(i).r2(i2);
    end
end