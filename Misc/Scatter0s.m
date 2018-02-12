function Scatter0s(NSTA,C)

Xs=[];
Ys=[];
for i=1:length(NSTA)
    if NSTA(i).class==0
        Xs=[Xs ; NSTA(i).xpos(1)];
        Ys=[Ys ; NSTA(i).ypos(1)];
    end
end
scatter(Xs,Ys,[],C)
hold on
axis ij