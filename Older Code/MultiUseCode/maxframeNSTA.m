function M=maxframeNSTA(NSTA)

M=0;
for i=1:length(NSTA)
    M=max(M,max(NSTA(i).frame));
end