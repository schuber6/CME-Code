function PlotRandomMSTraces(NSTA)

Num=20;
N=length(NSTA);
for i=1:Num
    found=false;
    while ~found
    T=ceil(rand*N);
    if NSTA(T).class==0 && length(NSTA(T).frame)>=10
        found=true;
    end
    end
    subplot(4,5,i)
    plot(NSTA(T).frame,NSTA(T).int,'g')
    hold on
    plot(NSTA(T).frame,NSTA(T).SlaveBS,'r')
end