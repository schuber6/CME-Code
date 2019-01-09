function PlotRandom2ColorTrace(fxycS)

N=length(fxycS);
for i=1:9
    found=false;
    while found==false
        Trace=ceil(rand*N);
        if fxycS(Trace).class~=4
            found=true;
        end
    end
    subplot(3,3,i)
    plot(fxycS(Trace).int,'g')
    hold on
    plot(fxycS(Trace).Sint,'r')
    title(strcat(num2str(Trace),'  Class=',num2str(fxycS(Trace).class)))
end

