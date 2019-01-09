Control=cell(1,5);
Osmo=cell(1,5);
figure
for i=1:length(MAC)
    %subplot(4,4,i)
    if i>4
        for i2=1:5
            Osmo{i2}=[Osmo{i2} MAC{i}(i2)-MAC{i}(1)];
        end
    else
        for i2=1:5
            Control{i2}=[Control{i2} MAC{i}(i2)-MAC{i}(1)];
        end
    end
end
for i=1:5
    MACc(i)=mean(Control{i});
    SACc(i)=sqrt(var(Control{i}))/sqrt(length(Control{i}));
    MACo(i)=mean(Osmo{i});
    SACo(i)=sqrt(var(Osmo{i}))/sqrt(length(Osmo{i}));
end
errorbar(MACc,SACc,'Color','g')
hold on
errorbar(MACo,SACo,'Color','r')
YL=ylim;
line([2.1 2.1],YL,'Color','b')
ylim(YL)
xlim([1 6])
ylabel('Normalized Log A:C Ratio')
legend('Control','Osmo')