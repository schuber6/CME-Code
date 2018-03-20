Cut=.64;
best=find(rsqs>Cut & rsqm>Cut & Am<4*10^5);
FSFig
for i=1:length(best)
    I=best(i);
    subplot(5,5,i)
    M=FXYCMS{I}(:,6);
    S=FXYCMS{I}(:,7);
    Mcme=FXYCMS{I}(:,5);
    plot(M/mean(M(1:10))*mean(S(1:10)),'g')
    hold on
    plot(S,'r')
    plot(Mcme/mean(Mcme(1:10))*mean(S(1:10)),'b')
end