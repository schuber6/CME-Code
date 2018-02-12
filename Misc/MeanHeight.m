M=0;
for i=1:length(NSTA)
    if M<max(NSTA(i).frame)
        M=max(NSTA(i).frame);
    end
end
ZList=cell(1,M);
ZListS=cell(1,M);
ZListSR=cell(1,M);
ZListSNF=cell(1,M);
for i=1:length(NSTA)
    if NSTA(i).class==0
    for i2=1:length(NSTA(i).frame)
        
%         ZListS{NSTA(i).frame(i2)}=[ZListS{NSTA(i).frame(i2)} NSTA(i).stSum(i2)];
%         ZListSR{NSTA(i).frame(i2)}=[ZListSR{NSTA(i).frame(i2)} NSTA(i).stRaw(i2)];
%         ZListSNF{NSTA(i).frame(i2)}=[ZListSNF{NSTA(i).frame(i2)} NSTA(i).stSumNF(i2)];
        ZList{NSTA(i).frame(i2)}=[ZList{NSTA(i).frame(i2)} NSTA(i).st(i2)];
        
    end
    end
end
for i=1:length(ZList)
    Me(i)=mean(ZList{i});
%     Me2(i)=mean(ZListS{i});
%     Me3(i)=mean(ZListSR{i});
%     Me4(i)=mean(ZListSNF{i});
end
figure
plot(Me)
hold on
%plot(Me2,'k')
%plot(Me3,'r')
% plot(Me4,'g')
YL=ylim;
for i=1:M
    if i/10==ceil(i/10)
        line([i i],[YL(1) YL(2)])
    end
end
xlabel('Frame #')
ylabel('Mean Z-Position')