function Trace=AverageTraceEndAligned(ACell)

ML=0;
for i=1:length(ACell)
    if length(ACell{i})>ML
        ML=length(ACell{i});
    end
end
MC=cell(1,ML);
for i=1:length(ACell)
    INT=ACell{i};
    ind=length(INT);
    for i2=1:length(INT)
        MC{i2-ind+ML}=[MC{i2-ind+ML} INT(i2)];
    end
end
Trace=StatCell(MC,'mean_assumezeros');