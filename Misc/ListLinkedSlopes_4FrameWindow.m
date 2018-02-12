LsI=[];
LsZ=[];
LvI=[];
LvZ=[];
LvF=[];
LsD=[];
LmI=[];
h=waitbar(0,'Listing Slopes');
for i=1:length(slopesINT)
    waitbar(i/length(slopesINT))
    for i2=1:length(slopesINT{i})
        if slopesINT{i}(i2)~=0 && minint{i}(i2)>=1000
            LsI=[LsI slopesINT{i}(i2)*3/fg];
            LsZ=[LsZ slopesZ{i}(i2)*3/fg];
            LvI=[LvI INTcell{i}(i2)];
            LmI=[LmI minint{i}(i2)];
            LvZ=[LvZ Zcell{i}(i2)];
            LvF=[LvF Fcell{i}(i2)];
            d1=[NSTA(inds(i)).xpos(i2-2) NSTA(inds(i)).ypos(i2-2)]; %May need to change for different frame rates
            d2=[NSTA(inds(i)).xpos(i2+1) NSTA(inds(i)).ypos(i2+1)];
            LsD=[LsD norm(d1-d2)];

        end
    end
end
close(h)
