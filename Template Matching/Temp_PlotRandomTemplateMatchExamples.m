

Bad=find(Dist100V>=Cutoff | Dist100V==0);
NumBad=length(Bad);
Kept=find(Dist100V<Cutoff & Dist100V>0);
NumKept=length(Kept);
Full=find(ML(Kept)-TL(Kept)<=TL(Kept)*.3);
NumFull=length(Full);
Partial=find(ML(Kept)-TL(Kept)>TL(Kept)*.3);
NumPartial=length(Partial);

FSFig
for i=1:5
    subplot(3,5,i)
    R=ceil(rand*NumBad);
    t=(1:length(ManI{Bad(R)}))*3;
    plot(t,ManI{Bad(R)})
        title(num2str(Dist100V(Bad(R))))
end
for i=1:5
    subplot(3,5,i+5)
    R=ceil(rand*NumPartial);
    I=Kept(Partial((R)));
    t=(1:length(ManI{I}))*3;
    plot(t,ManI{I})
    hold on
    inds=start(I):finish(I);
    Mini=ManI{I}(inds);
    Factor=mean(Mini);
    plot(inds*3,TemplateB{I}*Factor,'g')
    title(num2str(Dist100V(I)))
end
for i=1:5
    subplot(3,5,i+10)
    R=ceil(rand*NumFull);
    I=Kept(Full((R)));
    t=(1:length(ManI{I}))*3;
    plot(t,ManI{I})
    hold on
    inds=start(I):finish(I);
    Mini=ManI{I}(inds);
    Factor=mean(Mini);
    plot(inds*3,TemplateB{I}*Factor,'g')
    title(num2str(Dist100V(I)))
end
subplot(3,5,1)
ylabel(strcat('Bad Traces: N=',num2str(NumBad)))
subplot(3,5,6)
ylabel(strcat('Partial Traces: N=',num2str(NumPartial)))
subplot(3,5,11)
ylabel(strcat('Full Traces: N=',num2str(NumFull)))
