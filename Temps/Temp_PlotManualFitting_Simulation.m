for i=1:500
    Ints{i}=cell(1,20);
    Back{i}=cell(1,20);
end
for i=1:length(MIs)/40
    for i2=1:20
        Ints{ceil((i)/100)}{i2}=[Ints{ceil((i)/100)}{i2} MIs((i-1)*40+i2)];
        Back{ceil((i)/100)}{i2}=[Back{ceil((i)/100)}{i2} Bs((i-1)*40+i2)];
    end
end
for i=1:500
    GroupMean{i}=StatCell(Ints{i},'mean');
    GroupSD{i}=StatCell(Ints{i},'stdev');
    BackMean{i}=StatCell(Back{i},'mean');
    BackSD{i}=StatCell(Back{i},'stdev');
end
figure
for i=1:10
    errorbar(GroupMean{i},GroupSD{i})
    hold on
    SNR=max((zeros(1,20)+1300)./BackMean{i});
    L{i}=strcat('Max SNR ~ ',num2str(SNR));

end
legend(L)
%AddLinearRegLine_Color_0Intercept(1:20,GroupMean,[1 0 0])