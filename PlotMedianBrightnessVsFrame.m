function PlotMedianBrightnessVsFrame(NSTA)

BN=2;
M=maxframeNSTA(NSTA);
Groups=floor(M/20);
Ints=cell(2,M);
for i=1:length(NSTA)
    for i2=1:length(NSTA(i).frame)
        F=NSTA(i).frame(i2);
        IM=NSTA(i).int(i2);
        IS=NSTA(i).SlaveBS(i2);
        Ints{1,F}=[Ints{1,F} IM];
        Ints{2,F}=[Ints{2,F} IS];
    end
end
Bins=1:BN;
Frames=floor(M/(BN-1))*(Bins-1);
for i=1:length(Frames)
    if Frames(i)==0
        Frames(i)=1;
    end
end
xbins=1:30;
xbins=xbins/30*5000;
for i=Bins
    Hm=hist(Ints{1,Frames(i)},xbins);
    Hs=hist(Ints{2,Frames(i)},xbins);
    subplot(1,2,1)
    plot(xbins,Hm)
    hold on
    title('Master Distribution')
    subplot(1,2,2)
    plot(xbins,Hs)
    hold on
    title('Slave Distribution')
end
Spacing=floor(M/Groups);
for i=1:Groups
    GS(i)=Spacing*(i-1)+1;
    GE(i)=Spacing*i;
end
figure
% for i=1:M
%     MedM(i)=median(Ints{1,i});
%     MedS(i)=median(Ints{2,i});
%     MeanM(i)=mean(Ints{1,i});
%     MeanS(i)=mean(Ints{2,i});
% end
for i=1:Groups
    IsM=[];
    IsS=[];
    for i2=GS(i):GE(i)
        IsM=[IsM Ints{1,i2}];
        IsS=[IsS Ints{2,i2}];
    end
    MedM(i)=median(IsM);
    MedS(i)=median(IsS);
    MeanM(i)=mean(IsM);
    MeanS(i)=mean(IsS);
end
subplot(1,2,1)
plot(MedM,'g')
hold on
plot(MedS,'r')
subplot(1,2,2)
plot(MeanM,'g')
hold on
plot(MeanS,'r')