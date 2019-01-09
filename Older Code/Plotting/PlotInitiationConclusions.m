function PlotInitiationConclusions(Inits,Concs)
    
    
Rolling=10;
MF=length(Inits);
Is=zeros(1,MF);
Cs=zeros(1,MF);
for i=1:length(Inits)-Rolling+1
    for i2=1:Rolling
        Is(i)=Is(i)+length(Inits{i+i2-1});
        Cs(i)=Cs(i)+length(Concs{i+i2-1});
    end
end
x=(1:MF)*5;
plot(x,Is,'g')
hold on
plot(x,Cs,'r')
YL=ylim;
line([300 300],YL)
legend('Initiations','Conclusions','Time of Osmoshock')
xlabel('Time (seconds)')
ylabel('Number in Next 30 s')