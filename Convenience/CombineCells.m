function C=CombineCells(C1,C2)
    
    C=C1;
    ind=length(C)+1;
    for i=1:length(C2)
        C{ind}=C2{i};
        ind=ind+1;
    end