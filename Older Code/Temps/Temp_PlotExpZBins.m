for i=1:5
%     subplot(1,5,i)
%     plot(MN(:,i))
    for i2=1:3
        usedi2=find(Treatment==i2-1);
        MGM(i2,i)=mean(MN(usedi2,i));
        MGSE(i2,i)=sqrt(var((MN(usedi2,i))))/sqrt(length(usedi2));
    end
end

xbins=-2:2;
xbins=xbins*.04/2;
for i=1:3
    if i==1
        C=[1 0 0];
    end
    if i==2
        C=[1 0 1];
    end
    if i==3
        C=[0 0 1];
    end
    errorbar(xbins,MGM(i,:),MGSE(i,:),'Color',C)
    hold on
    title('Blue-Control (N=7), Magenta-Jasp (N=6), Red-QQN (N=5)')
    xlabel('Josh Slope')
    ylabel('Average Z Velocity (nm/s)')
end