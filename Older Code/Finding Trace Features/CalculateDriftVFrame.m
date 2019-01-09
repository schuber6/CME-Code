function [XvF,YvF,ZvF,MXvF,MYvF,MZvF,SXvF,SYvF,SZvF]=CalculateDriftVFrame(NSTA)
%Subtracts average velocity in X, Y, and Z from positions
%New positions will not correspond to image pixels anymore
M=maxframeNSTA(NSTA);
XvF=cell(1,M);
YvF=cell(1,M);
ZvF=cell(1,M);
h=waitbar(0,'Calculating Average Drift');
AverageWindow=20;
for i=1:length(NSTA)
    
    waitbar(i/length(NSTA))
    used=find(NSTA(i).frame);
    for i2=1:length(used)-30 %To exclude lifting part
        dt=NSTA(i).frame(used(i2+1))-NSTA(i).frame(used(i2));
        t=NSTA(i).frame(used(i2));
        Xv=(NSTA(i).xpos(used(i2+1))-NSTA(i).xpos(used(i2)))/dt;
        Yv=(NSTA(i).ypos(used(i2+1))-NSTA(i).ypos(used(i2)))/dt;
        Zv=(NSTA(i).st(used(i2+1))-NSTA(i).st(used(i2)))/dt;
        for i3=0:min([AverageWindow M-t+1])-1
        XvF{t+i3}=[XvF{t+i3} Xv];
        YvF{t+i3}=[YvF{t+i3} Yv];
        ZvF{t+i3}=[ZvF{t+i3} Zv];
        end
    end
    
    
    
end
for i=1:length(XvF)
    MXvF(i)=mean(XvF{i});
    MYvF(i)=mean(YvF{i});
    MZvF(i)=mean(ZvF{i});
    SXvF(i)=sqrt(var(XvF{i}));
    SYvF(i)=sqrt(var(YvF{i}));
    SZvF(i)=sqrt(var(ZvF{i}));
end
close(h)
subplot(1,2,1)
plot(MXvF)
hold on
plot(MYvF)
plot(MZvF)
title('Mean Drifts')
subplot(1,2,2)
plot(SXvF)
hold on
plot(SYvF)
plot(SZvF)
title('Velocity SDs')
used=find(MXvF>-1000000);
mean(MXvF(used))
mean(MYvF(used))
mean(MZvF(used))

