function [MSD,Background]=ConstructMasterSlaveDataCell5(SlaveINT,Threshfxyc,Thresh)
%field 1=frame
%2=master x
%3=master y
%4=master amp
%5=slave amp
%6=slave x
%7=slave y
%8=slave background
%9=slave sd x
%10=slave sd y
%11=slave theta
%12=Sum intensity (minus background)
MSD=cell(1,length(SlaveINT));
GoodC=find(Threshfxyc(1,4,:));
GoodT=[];
Window=5;
for i=1:length(GoodC)
    if max(Threshfxyc(:,5,GoodC(i)))>=Thresh
        GoodT=[GoodT GoodC(i)];
    end
end
Back=[];
for i=1:length(GoodT)
    
    used=find(Threshfxyc(:,1,GoodT(i)));
    for i2=1:length(used)
        MSD{i}(i2,4)=Threshfxyc(used(i2),5,GoodT(i));
        MSD{i}(i2,2)=Threshfxyc(used(i2),2,GoodT(i));
        MSD{i}(i2,3)=Threshfxyc(used(i2),3,GoodT(i));
        MSD{i}(i2,1)=Threshfxyc(used(i2),1,GoodT(i));
        MSD{i}(i2,5)=SlaveINT{i}(i2,2);
        MSD{i}(i2,6)=SlaveINT{i}(i2,3)+round(MSD{i}(i2,2))-3; %Should be dependent on window--generalize if you change window
        MSD{i}(i2,7)=SlaveINT{i}(i2,4)+round(MSD{i}(i2,3))-3;
        MSD{i}(i2,8)=SlaveINT{i}(i2,1);
        MSD{i}(i2,9)=SlaveINT{i}(i2,5);
        MSD{i}(i2,10)=SlaveINT{i}(i2,6);
        MSD{i}(i2,11)=SlaveINT{i}(i2,7);
        MSD{i}(i2,12)=SlaveINT{i}(i2,8);
    end
    Back=[Back ; SlaveINT{i}(:,1)];
end
Background=median(Back);