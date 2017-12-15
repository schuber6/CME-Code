function M=FindMaxst(NSTA)

M=0;
for i=1:length(NSTA)
    if M<max(NSTA(i).st)
        M=max(NSTA(i).st);
    end
end