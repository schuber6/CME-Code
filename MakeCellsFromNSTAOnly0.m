function [Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTAOnly0(NSTA)

ind=1;
for i=1:length(NSTA)
    if NSTA(i).class==0 
        Zcell{ind}=NSTA(i).st;
        INTcell{ind}=NSTA(i).int;
        Fcell{ind}=NSTA(i).frame;
        inds(ind)=i;
        ind=ind+1;
    end
end