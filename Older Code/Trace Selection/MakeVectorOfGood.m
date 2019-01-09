function used=MakeVectorOfGood(usedC)
    
    used=[];
    for i=1:length(usedC)
        if ~isempty(usedC{i})
            used=[used i];
        end
    end