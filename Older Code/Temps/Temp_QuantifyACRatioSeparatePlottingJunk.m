for i=1:length(MAC)
    plot(MAC{i})
    hold on
end

%%
clear MA SA
for i=1:length(MCell)
    for i2=1:length(MCell{i})
        MA{i}(i2)=median(MCell{i}{i2});
        SA{i}(i2)=median(SCell{i}{i2});
    end
end

%%
clear MA SA
for i=1:length(MCell)
    for i2=1:length(MCell{i})
%         MA{i}(i2)=median(MCell{i}{i2});
%         SA{i}(i2)=median(SCell{i}{i2});
        MA{i}(i2)=mean(MCell{i}{i2});
        SA{i}(i2)=mean(SCell{i}{i2});
    end
end

%%
figure
subplot(1,2,1)
for i=1:length(MAC)
    if i<=4
        col=[0 1 0];
    else
        col=[1 0 0];
    end
    plot(MA{i},'Color',col)
    hold on
end
xlabel('Stack Number')
ylabel('Median AP2 Intensity')
xlim([.5 5.5])
subplot(1,2,2)
for i=1:length(MAC)
    if i<=4
        col=[0 1 0];
    else
        col=[1 0 0];
    end
    plot(SA{i},'Color',col)
    hold on
end
xlabel('Stack Number')
ylabel('Median CLCa Intensity')
xlim([.5 5.5])

%%
figure
subplot(1,2,1)
for i=1:length(MAC)
    if i<=4
        col=[0 1 0];
    else
        col=[1 0 0];
    end
    plot(MA{i}/MA{i}(1),'Color',col)
    hold on
end
xlabel('Stack Number')
ylabel('Mean AP2 Intensity')
xlim([.5 5.5])
subplot(1,2,2)
for i=1:length(MAC)
    if i<=4
        col=[0 1 0];
    else
        col=[1 0 0];
    end
    plot(SA{i}/SA{i}(1),'Color',col)
    hold on
end
xlabel('Stack Number')
ylabel('Mean CLCa Intensity')
xlim([.5 5.5])
