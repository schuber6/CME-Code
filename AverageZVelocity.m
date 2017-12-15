function [t,VzM,VzSD,VzL]=AverageZVelocity(nsta)

AvF=2;
FrameGap=3;
F=0;
for i=1:length(nsta)
    F=max(F,max(nsta(i).frame));
end
VzL=cell(1,F-(AvF-1));
for i=1:length(nsta)
    if nsta(i).class==0
        for i2=1:length(nsta(i).frame)-(AvF-1)
            Vs=(nsta(i).st(i2+(AvF-1))-nsta(i).st(i2))/(AvF-1);
            VzL{nsta(i).frame(i2)}=[VzL{nsta(i).frame(i2)} Vs];
        end
    end
end
for i=1:length(VzL)
    t(i)=i*FrameGap;
    VzM(i)=mean(VzL{i});
    VzSD(i)=sqrt(var(VzL{i}));
end