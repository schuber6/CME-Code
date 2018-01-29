CC=[];
CO=[];
IC=[];
IO=[];
FC=[];
FO=[];
for i=1:length(MAC)
    C=mean(MAC{i}(1:2)-MAC{i}(3:4));
    I=mean(MAC{i}(1:2));
    F=mean(MAC{i}(3:4));
    if i<=4
        plot(MAC{i},'g')
        hold on
        CC=[CC C];
        IC=[IC I];
        FC=[FC F];
    else
        plot(MAC{i},'r')
        CO=[CO C];
        IO=[IO I];
        FO=[FO F];
    end
end
figure
scatter(IC,FC,'g')
hold on
scatter(IO,FO,'r')
XL=xlim;
line(XL,XL)
AddLinearRegLine_Color(IC,FC,[0 1 0])
AddLinearRegLine_Color(IO,FO,[1 0 0])
xlabel('Initial Log A:C Ratio')
ylabel('Final Log A:C Ratio')
legend('Control','Osmo')