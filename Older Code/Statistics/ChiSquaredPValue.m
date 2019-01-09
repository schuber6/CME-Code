function PValue=ChiSquaredPValue(Data,FitData,DF)

CS=0;
for i=1:length(Data)
    CS=CS+ (Data(i)-FitData(i))^2/FitData(i);
end
PValue=chi2cdf(CS,DF,'upper');