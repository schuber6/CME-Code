function SuperSubplot(i)
    
    %Organizes subplots into 5x5 grids, making new plots for new ones
    M=mod(i,25);
    if M==0
        M=25;
    end
    if M==1
        figure
    end
    subplot(5,5,M)