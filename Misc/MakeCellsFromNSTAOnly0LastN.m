function [ZcellN,INTcellN,FcellN,indsN]=MakeCellsFromNSTAOnly0LastN(NSTA)

N=10;
ind=1;
for i=1:length(NSTA)
    if NSTA(i).class==0 && length(NSTA(i).frame)>=N && min(NSTA(i).st)~=max(NSTA(i).st)
        used=find(NSTA(i).frame,N,'last');
        ZcellN{ind}=NSTA(i).st(used)+rand*.00001; %Add noise to avoid std==0 problem
        INTcellN{ind}=NSTA(i).int(used);
        FcellN{ind}=NSTA(i).frame(used);
        indsN(ind)=i;
        ind=ind+1;
    end
end