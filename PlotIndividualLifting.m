function PlotIndividualLifting(NSTA)

N=length(NSTA);
M=FindMaxst(NSTA);
for i=1:8
    subplot(4,4,2*i-1)
    done=0;
    while ~done
        T=ceil(rand*N);
    if NSTA(T).class==0
        done=1;
    end
    end
    plot(NSTA(T).st,'b')
    ylim([0 M])
    hold on
    subplot(4,4,2*i)
    plot(NSTA(T).int,'r')
    
end
        
