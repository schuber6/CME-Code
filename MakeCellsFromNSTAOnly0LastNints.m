function [ZcellN,INTcellN,FcellN,indsN]=MakeCellsFromNSTAOnly0LastNints(NSTA)

N=10;
ind=1;
for i=1:length(NSTA)
    if NSTA(i).class==0 && length(NSTA(i).frame)>=N
        used=find(NSTA(i).frame,N,'last');
        ZcellN{ind}=ceil(100*NSTA(i).st(used));
        INTcellN{ind}=NSTA(i).int(used);
        FcellN{ind}=NSTA(i).frame(used);
        indsN(ind)=i;
        ind=ind+1;
    end
end