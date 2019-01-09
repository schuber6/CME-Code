CC=[];
CO=[];
IC=[];
IO=[];
FC=[];
FO=[];

IclC=[];
IapC=[];
IclO=[];
IapO=[];

FclC=[];
FapC=[];
FclO=[];
FapO=[];
for i=1:length(MAC)
    C=mean(MAC{i}(1:2)-MAC{i}(3:4));
    I=mean(MAC{i}(1:2));
    F=mean(MAC{i}(3:4));
    Iclath=median([SCell{i}{1} SCell{i}{2}]);
    Iap2=median([MCell{i}{1} MCell{i}{2}]);
    Fclath=median([SCell{i}{3} SCell{i}{4}]);
    Fap2=median([MCell{i}{3} MCell{i}{4}]);
    if i<=4
        %plot(MAC{i},'g')
        %hold on
        CC=[CC C];
        IC=[IC I];
        FC=[FC F];
        IclC=[IclC Iclath];
        IapC=[IapC Iap2];
        FclC=[FclC Fclath];
        FapC=[FapC Fap2];
    else
        %plot(MAC{i},'r')
        CO=[CO C];
        IO=[IO I];
        FO=[FO F];
        IclO=[IclO Iclath];
        IapO=[IapO Iap2];
        FclO=[FclO Fclath];
        FapO=[FapO Fap2];
    end
end
figure
scatter(log(IapC./IclC),log(FapC./FclC),'g')
hold on
scatter(log(IapO./IclO),log(FapO./FclO),'r')
XL=xlim;
line(XL,XL)
%AddLinearRegLine_Color([IapC IapO],[FapC-IapC FapO-IapO],[0 0 1])
AddLinearRegLine_Color(log(IapC./IclC),log(FapC./FclC),[0 1 0])
AddLinearRegLine_Color(log(IapO./IclO),log(FapO./FclO),[1 0 0])
%xlabel('Initial Log A:C Ratio')
xlabel('Initial log A:C Ratio')
ylabel('Final log A:C Ratio')
%legend('Control','Osmo')

figure
scatter(IclC,CC,'g')
hold on
scatter(IclO,CO,'r')
XL=xlim;
%line(XL,XL)
%AddLinearRegLine_Color(IC,FC,[0 1 0])
%AddLinearRegLine_Color(IO,FO,[1 0 0])
%xlabel('Initial Log A:C Ratio')
xlabel('Initial Median Clathrin Intensity')
ylabel('Change in Log A:C Ratio')
legend('Control','Osmo')

figure
scatter(IapC,CC,'g')
hold on
scatter(IapO,CO,'r')
XL=xlim;
%line(XL,XL)
%AddLinearRegLine_Color(IC,FC,[0 1 0])
%AddLinearRegLine_Color(IO,FO,[1 0 0])
%xlabel('Initial Log A:C Ratio')
xlabel('Initial Median AP2 Intensity')
ylabel('Change in Log A:C Ratio')
legend('Control','Osmo')

figure
scatter(IapC,(FapC-IapC),'g')
hold on
scatter(IapO,(FapO-IapO),'r')
XL=xlim;
%line(XL,XL)
AddLinearRegLine_Color([IapC IapO],[FapC-IapC FapO-IapO],[0 0 1])
%AddLinearRegLine_Color(IC,FC,[0 1 0])
%AddLinearRegLine_Color(IO,FO,[1 0 0])
%xlabel('Initial Log A:C Ratio')
xlabel('Initial ap2 intensity')
ylabel('Change in ap2 intensity')
%legend('Control','Osmo')


figure
scatter(IclC,(FclC-IclC),'g')
hold on
scatter(IclO,(FclO-IclO),'r')
XL=xlim;
%line(XL,XL)
AddLinearRegLine_Color([IclC],[FclC-IclC],[0 0 1])
%AddLinearRegLine_Color(IO,FO,[1 0 0])
%xlabel('Initial Log A:C Ratio')
xlabel('Initial clathrin intensity')
ylabel('Change in clathrin intensity')
%legend('Control','Osmo')

offset=1929;
figure
scatter(log(IapC./(IclC-offset)),log(FapC./(FclC-offset)),'g')
hold on
scatter(log(IapO./(IclO-offset)),log(FapO./(FclO-offset)),'r')
XL=xlim;
line(XL,XL)
%AddLinearRegLine_Color([IapC IapO],[FapC-IapC FapO-IapO],[0 0 1])
AddLinearRegLine_Color(log(IapC./(IclC-offset)),log(FapC./(FclC-offset)),[0 1 0])
AddLinearRegLine_Color(log(IapO./(IclO-offset)),log(FapO./(FclO-offset)),[1 0 0])
%xlabel('Initial Log A:C Ratio')
xlabel('Initial log A:C Ratio')
ylabel('Final log A:C Ratio')
%legend('Control','Osmo')
