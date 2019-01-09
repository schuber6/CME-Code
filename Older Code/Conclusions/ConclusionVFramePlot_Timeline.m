function Y=ConclusionVFramePlot_Timeline(files,Areas)

FrameGap=2;
MaxFrame=151;
Tmast=3000;
Tslave=0;
AvWindow=30;
MinLTF=30/FrameGap;
EdgesF=1:15:151; 
for i=1:length(EdgesF)-1
    Cent(i)=mean([EdgesF(i) EdgesF(i+1)]);
end

for i=1:length(files)
    clear Fs Yc
    for i2=1:length(files{i})
        load(files{i}{i2})
        [Nc,Fs{i2}]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
    end
    
    for i2=1:length(Fs)
        Yc{i}{i2}=hist(Fs{i2},Cent);
        Yc{i}{i2}=Yc{i}{i2}/Areas{i}(i2);
    end
    Y{i}=Yc{i}{1};
    for i2=2:length(Yc{i})
        Y{i}=Y{i}+Yc{i}{i2};
    end
    Y{i}=Y{i}(3:end-2)/length(Yc{i});
end

Cent=Cent(3:end-2)*FrameGap;
figure
plot((Cent-max(Cent))/60,Y{1}*2,'g')
hold on
plot((Cent-max(Cent))/60,Y{4}*2,'b')
hold on
plot((Cent-min(Cent)+210)/60,Y{2}*2,'g')
hold on
plot((Cent-min(Cent)+210)/60,Y{5}*2,'b')
hold on
plot((Cent-min(Cent)+630)/60,Y{3}*2,'g')
hold on
plot((Cent-min(Cent)+630)/60,Y{6}*2,'b')
hold on

legend('Control','CALM siRNA')
ylabel('Internalizations / minute / um^2')
xlabel('Time (minutes from osmotic shock)')