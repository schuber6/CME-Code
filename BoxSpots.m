function [IMmn,IMsn]=BoxSpots(Pos,IMm,IMs)

[Y,X]=size(IMm);
IMmn(:,:,1)=IMm;
IMmn(:,:,2)=IMm;
IMmn(:,:,3)=IMm;
IMsn(:,:,1)=IMs;
IMsn(:,:,2)=IMs;
IMsn(:,:,3)=IMs;
if isempty(Pos)
    return
end
for i=1:length(Pos(:,1))
    x=round(Pos(i,1));
    y=round(Pos(i,2));
    if Pos(i,3)==1
        c=[1 0 0];
    end
    if Pos(i,3)==2
        c=[1 1 0];
    end
    if Pos(i,3)==3
        c=[1 0 1];
    end
    if Pos(i,3)==4
        c=[0 1 0];
    end
    if Pos(i,3)==5
        c=[0 1 1];
    end
    if Pos(i,3)==6
        c=[0 0 1];
    end
    if x~=0 && y~=0
        for xoff=-4:4
            for yoff=-4:4
                if (abs(xoff)==4 || abs(yoff)==4) && x+xoff>0 && x+xoff<=X && y+yoff>0 && y+yoff<=Y
                    IMmn(y+yoff,x+xoff,:)=6000*c;
                    IMsn(y+yoff,x+xoff,:)=6000*c;
                end
            end
        end
    end
end