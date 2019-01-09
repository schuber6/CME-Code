figure
for i=1:length(p)
    subplot(5,2,i*2-1)
    hist(p{i},50)
    title(num2str(MedR(i)))
    subplot(5,2,i*2)
    hist(FPp{i},50)
    title(num2str(MedG(i)))
end

%%

for i=1:length(p)
    MP(i)=median(p{i});
    MFP(i)=median(FPp{i});
end
figure
scatter(MedR,MP)
xlabel('Median Max Clathrin Intensity')
ylabel('Median Accuracy of Traces')
figure
scatter(MedR,MFP)
xlabel('Median Max Clathrin Intensity')
ylabel('Median False Positive Rate')