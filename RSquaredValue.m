function RValue=RSquaredValue(Data,FitData)

SStot=0;
SSres=0;
M=mean(Data);
for i=1:length(Data)
    SStot=SStot+ (Data(i)-M)^2;
    SSres=SSres+ (Data(i)-FitData(i))^2;
end
RValue=1-SSres/SStot;
