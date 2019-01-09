LsI=[];
LsZ=[];
LsD=[];
NT=0;
h=waitbar(0,'Listing Slopes');
for i=1:length(slopesINT)
    waitbar(i/length(slopesINT))
    counted=0;
    for i2=1:length(slopesINT{i})
        if slopesINT{i}(i2)~=0 && NSTA(inds(i)).frame(i2)>=beg && NSTA(inds(i)).frame(i2)<=fin
            if ~counted
                counted=1;
            end
            LsI=[LsI slopesINT{i}(i2)];
            LsZ=[LsZ slopesZ{i}(i2)];
%             d1=[NSTA(inds(i)).xpos(i2-3) NSTA(inds(i)).ypos(i2-3)]; %May need to change for different frame rates
%             d2=[NSTA(inds(i)).xpos(i2+1) NSTA(inds(i)).ypos(i2+1)];
%             LsD=[LsD norm(d1-d2)];
        end
    end
    if counted
        NT=NT+1;
    end
end
close(h)