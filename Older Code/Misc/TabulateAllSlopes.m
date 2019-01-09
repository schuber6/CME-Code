function slopes=TabulateAllSlopes(nsta)

slopes=[];
for i=1:length(nsta)
    if nsta(i).class~=4 && nsta(i).class~=7
        slopes=[slopes ; nonzeros(nsta(i).sl)];
    end
end

