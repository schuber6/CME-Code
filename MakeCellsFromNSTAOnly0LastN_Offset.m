function [ZcellNO,INTcellNO,FcellNO,indsNO]=MakeCellsFromNSTAOnly0LastN_Offset(NSTA,N)

%N=20;
ind=1;
for i=1:length(NSTA)
    if NSTA(i).class==0 && length(NSTA(i).frame)>=N && min(NSTA(i).st)~=max(NSTA(i).st)
        used=find(NSTA(i).frame,N,'last');
        offset=median(NSTA(i).st(used));
        ZcellNO{ind}=NSTA(i).st(used)-offset+rand*.00001; %Add noise to avoid std==0 problem
        INTcellNO{ind}=NSTA(i).int(used);
        FcellNO{ind}=NSTA(i).frame(used);
        indsNO(ind)=i;
        ind=ind+1;
    end
end