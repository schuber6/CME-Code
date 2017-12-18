function [Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTA_Slave_PB(NSTA)

ind=1;
for i=1:length(NSTA)
    if NSTA(i).class<4 
        Zcell{ind}=NSTA(i).SlaveBS_PB;%*(rand*.0001); %Noise added to fix 0 problem in slope_finding--should be too small to make a difference
        INTcell{ind}=NSTA(i).int;
        Fcell{ind}=NSTA(i).frame;
        inds(ind)=i;
        ind=ind+1;
    end
end