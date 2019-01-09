function lifetimes=TabulateAllLifetimes(nsta)

lifetimes=[];
for i=1:length(nsta)
    if nsta(i).class==3
        lifetimes=[lifetimes ; nsta(i).lt];
    end
end
