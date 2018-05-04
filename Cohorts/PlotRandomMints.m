function PlotRandomMints(Mints,Sints)
    
    N=length(Mints{1});
    FSFig
    for i=1:25
        subplot(5,5,i)
        R=ceil(rand*N);
        for i2=1:length(Mints)
            M(i2)=Mints{i2}(R);
            S(i2)=Sints{i2}(R);
        end
        plot(M,'r')
        hold on
        plot(S,'g')
        title(num2str(R))
    end
    