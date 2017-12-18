F0=zeros(1,1000);
F=zeros(1,1000);
for i=1:length(N)
    frames=N(i).frame;
    if N(i).class==0
        for i2=1:length(frames)
            F0(frames(i2))=F0(frames(i2))+1;
        end
    else
        for i2=1:length(frames)
            F(frames(i2))=F(frames(i2))+1;
        end
    end
end
plot(F)
hold on
plot(F0,'r')