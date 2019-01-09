 FSFig()
    for i=1:5

        SampC(i)=length(Mc{i});
        SampO(i)=length(Mo{i});
        MedMC(i)=median(Mc{i});
        MedMO(i)=median(Mo{i});
        MedSC(i)=median(Sc{i});
        MedSO(i)=median(So{i});
        
        MedACC(i)=median(log(Mc{i}./Sc{i}));
        MedACO(i)=median(log(Mo{i}./So{i}));
        
        SDMC(i)=sqrt(var(Mc{i}))/sqrt(SampC(i));
        SDMO(i)=sqrt(var(Mo{i}))/sqrt(SampO(i));
        SDSC(i)=sqrt(var(Sc{i}))/sqrt(SampC(i));
        SDSO(i)=sqrt(var(So{i}))/sqrt(SampO(i));
        
        SDACC(i)=sqrt(var(log(Mc{i}./Sc{i})))/sqrt(SampC(i));
        SDACO(i)=sqrt(var(log(Mo{i}./So{i})))/sqrt(SampO(i));
        
%         MedMC(i)=mean(Mc{i});
%         MedMO(i)=mean(Mo{i});
%         MedSC(i)=mean(Sc{i});
%         MedSO(i)=mean(So{i});
%         
%         MedACC(i)=mean(log(Mc{i}./Sc{i}));
%         MedACO(i)=mean(log(Mo{i}./So{i}));

    end
%     subplot(2,2,1)
%     plot(MedMC,'g')
%     hold on
%     plot(MedMO,'r')
%     YL=ylim;
%     line([2.1 2.1],YL,'Color','b')
%     legend('Control','85% Osmoshock','Addition of Water')
%     
%     title('CALM Intensity')
%     subplot(2,2,2)
%     plot(MedSC,'g')
%     hold on
%     plot(MedSO,'r')
%     YL=ylim;
%     line([2.1 2.1],YL,'Color','b')
%     title('Clathrin Intensity')
%     subplot(2,2,3)
%     plot(MedACC-MedACC(1),'g')
%     hold on
%     title('Log A:C Ratio (Relative to first stack)')
%     plot(MedACO-MedACO(1),'r')
%     YL=ylim;
%     line([2.1 2.1],YL,'Color','b')
%     subplot(2,2,4)
%     plot(SampC,'g')
%     hold on
%     plot(SampO,'r')
%     title('Number of Spots')
%     YL=ylim;
%     line([2.1 2.1],YL,'Color','b')
    
        subplot(2,2,1)
    errorbar(MedMC,SDMC,'Color','g')
    hold on
    errorbar(MedMO,SDMO,'Color','r')
    YL=ylim;
    line([2.1 2.1],YL,'Color','b')
    legend('Control','85% Osmoshock','Addition of Water')
    
    title('AP2 Intensity')
    subplot(2,2,2)
    errorbar(MedSC,SDSC,'Color','g')
    hold on
    errorbar(MedSO,SDSO,'Color','r')
    YL=ylim;
    line([2.1 2.1],YL,'Color','b')
    title('Clathrin Intensity')
    subplot(2,2,3)
    errorbar(MedACC-MedACC(1),SDACC,'Color','g')
    hold on
    title('Log A:C Ratio (Relative to first stack)')
    errorbar(MedACO-MedACO(1),SDACO,'Color','r')
    YL=ylim;
    line([2.1 2.1],YL,'Color','b')
    subplot(2,2,4)
    plot(SampC,'g')
    hold on
    plot(SampO,'r')
    title('Number of Spots')
    YL=ylim;
    line([2.1 2.1],YL,'Color','b')
