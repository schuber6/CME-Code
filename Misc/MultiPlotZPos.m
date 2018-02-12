function MultiPlotZPos(nsta)

N=length(nsta);
figure
for i=1:10
    
    looking=true;
    while looking
        trace=ceil(rand*N);
        if nsta(trace).class==0 && max(nsta(trace).int)>=1500
            looking=false;
        end
    end
    if i<=5
        subplot(5,5,i)
    else
        subplot(5,5,i+10)
    end
    plot(nsta(trace).frame,nsta(trace).int,'r')
    
    if i<=5
        subplot(5,5,i+5)
    else
        subplot(5,5,i+15)
    end
    plot(nsta(trace).st,'b')
    hold on
    %plot(nsta(trace).stM,'k')
    %plot(nsta(trace).stM3,'r')
%     plot(nsta(trace).stSumNF,'g')
end