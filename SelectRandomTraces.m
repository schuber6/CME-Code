function [Selected,Cs]=SelectRandomTraces(TraceFXY,N,TraceA,GFPInt)

Selected=[];
Cs=[];
colors = distinguishable_colors(N);
figure
for i=1:N
    subplot(ceil(sqrt(N)),ceil(sqrt(N)),i)
    T=ceil(rand*length(TraceFXY));
    Selected=[Selected ; TraceFXY{T}];
    LT=length(TraceFXY{T}(:,1));
    for i2=1:LT
        Cs=[Cs ; colors(i,:)];
    end
    plot(TraceA{T}/GFPInt,'Color',colors(i,:))
end