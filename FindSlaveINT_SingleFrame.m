function XYAmAs=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame)

IM=imread(fileSlave,'Index',SlaveFrame);
[A,~]=size(XYA);
XYAmAs=zeros(A,4);

for i=1:length(XYA(:,1))
    
    c=FitSlave_IM(XYA(i,1),XYA(i,2),IM);
    XYAmAs(i,:)=[XYA(i,:) c(2)];
end