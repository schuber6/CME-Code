function PlotClosestN(Cs,Masts,Slaves,N,Look)

figure
Dif=abs(Cs-Look);
Sd=sort(Dif);
Least=Sd(1:N);
for i=1:N
    subplot(3,3,i)
    ind=find(Dif==Sd(i));
    M=Masts{ind};
    t=1:length(M);
    t=(t-11)*3;
    plot(t,M,'g')
    hold on
    plot(t,Slaves{ind},'r')
    title(num2str(Cs(ind)))
end