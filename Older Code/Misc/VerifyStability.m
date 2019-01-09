function S=VerifyStability(bx,by,masksp1)
%Checks to see what percent of bleb pixels stay for another frame to weed
%out noise
S=[];
for i=1:length(bx)
    Px=length(bx{i});
    SPx=0;
    for i2=1:Px
        if masksp1(by{i}(i2),bx{i}(i2))>=.5
            SPx=SPx+1;
        end
    end
       S(i)=SPx/Px;     
end