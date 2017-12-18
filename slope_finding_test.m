clear ints
ints{1}=1:100;
ints{1}=ints{1}.';
for i=1:100
    fg=12/i;
[slopes{i}] = slope_finding_NoNorm(ints,fg,0);
end