function PlotAllMints(Mints,Sints,FrameGap,Scaled)
    
    N=length(Mints{1});
    FSFig
    for i=1:length(Mints{1})
        if mod(i,25)==0
            FSFig
        end
        subplot(5,5,mod(i,25)+1)
        R=i;
        for i2=1:length(Mints)
            M(i2)=Mints{i2}(R);
            S(i2)=Sints{i2}(R);
        end
        if Scaled
            M=M-min(M);
            S=S-min(S);
            M=M/max(M);
            S=S/max(S);
        end
        t=(1:length(M))*FrameGap;
        plot(t,M,'r')
        hold on
        plot(t,S,'g')
        title(num2str(R))
    end
    