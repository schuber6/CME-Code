function ACs=ListRecruitmentACRatios(Mast,Slave)

for i=1:length(Mast)-1
    MD(i)=Mast(i+1)-Mast(i);
    SD(i)=Slave(i+1)-Slave(i);
end
usedI=find(MD>0 & SD>0);
usedD=find(MD<0 & SD<0);
ACs=[];
for i=1:length(usedI)
    ACs=[ACs log(MD(usedI(i))/SD(usedI(i)))];
end
