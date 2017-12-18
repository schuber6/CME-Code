function [ZcellNO,INTcellNO,FcellNO,indsNO,SLAVEcellNO]=MakeCellsFromNSTAOnly0LastN_Offset_Slave(NSTA,N)

%N=20;
ind=1;
SlaveCutoff=10000;
for i=1:length(NSTA)
    if NSTA(i).class==0 && length(NSTA(i).frame)>=N && min(NSTA(i).st)~=max(NSTA(i).st) && mean(NSTA(i).Slave5x5)>=SlaveCutoff
        used=find(NSTA(i).frame,N,'last');
        offset=median(NSTA(i).st(used));
        ZcellNO{ind}=NSTA(i).st(used)-offset+rand*.00001; %Add noise to avoid std==0 problem
        %offset2=median(NSTA(i).SlaveBS(used));
        SLAVEcellNO{ind}=NSTA(i).SlaveBS(used).' +rand*.00001; %Add noise to avoid std==0 problem
        INTcellNO{ind}=NSTA(i).int(used);
        FcellNO{ind}=NSTA(i).frame(used);
        indsNO(ind)=i;
        ind=ind+1;
    end
end