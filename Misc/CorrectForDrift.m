function [MXvF,MYvF,MZvF,NSTAc]=CorrectForDrift(NSTA)
%Subtracts average velocity in X, Y, and Z from positions
%New positions will not correspond to image pixels anymore
M=maxframeNSTA(NSTA);
XvF=cell(1,M);
YvF=cell(1,M);
ZvF=cell(1,M);
AverageWindow=1;
h=waitbar(0,'Calculating Average Drift');
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
    if ~isempty(XvF{i})
        MXvF(i)=mean(XvF{i});
        MYvF(i)=mean(YvF{i});
        MZvF(i)=mean(ZvF{i});
        SXvF(i)=sqrt(var(XvF{i}));
        SYvF(i)=sqrt(var(YvF{i}));
        SZvF(i)=sqrt(var(ZvF{i}));
    else
        MXvF(i)=0;
        MYvF(i)=0;
        MZvF(i)=0;
        SXvF(i)=0;
        SYvF(i)=0;
        SZvF(i)=0;
    end
end
close(h)
NSTAc=NSTA;
for i=1:length(NSTA)
    F1=NSTA(i).frame(1);
    for i2=1:length(NSTA(i).frame)
        fd=NSTA(i).frame(i2)-F1;
        NSTAc(i).xpos(i2)=NSTAc(i).xpos(i2)-sum(MXvF(F1:F1+fd));
        NSTAc(i).ypos(i2)=NSTAc(i).ypos(i2)-sum(MYvF(F1:F1+fd));
        NSTAc(i).st(i2)=NSTAc(i).st(i2)-sum(MZvF(F1:F1+fd));
    end
end
