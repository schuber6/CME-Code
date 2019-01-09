order=randperm(2040);
train=order(1:1200);
CV=order(1201:1600);
test=order(1601:2040);
trainData=Data(train);
CVData=Data(CV);
testData=Data(test);
save('MLData_PixelSum_B2_Split.mat','trainData','CVData','testData')