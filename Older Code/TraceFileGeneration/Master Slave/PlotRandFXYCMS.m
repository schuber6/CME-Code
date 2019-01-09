MF=15;
MA=500;
for i=1:9
    subplot(3,3,i)
    found=false;
    while ~found
        T=ceil(rand*length(fxycMS(1,1,:)));
        Frames=nonzeros(fxycMS(:,1,T));
        Amps=fxycMS(:,5,T);
        C=fxycMS(1,4,T);
        if length(Frames)>=MF && max(Amps)>=MA && C==3
            found=1;
        end
    end
    Mast=fxycMS(:,9,T); %Set to look at 5x5 sum intensity--if you use 9,6 that'll give the 5x5-the average of the ring around it
    Slave=fxycMS(:,6,T);
    plot(nonzeros(Mast)/max(Mast),'g')
    hold on
    plot(nonzeros(Slave)/max(Slave),'r')
    %plot(nonzeros(Amps),'b')
end