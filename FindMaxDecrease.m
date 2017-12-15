function T=FindMaxDecrease(trace)

for i=1:length(trace)-2
    y=trace(i:i+2);
    x=(1:3).';
    [slope(i), intercept, rsq(i)]=LinearSlopeInterceptandR2(x,y);
end
used=find(rsq>=.4);
Ms=min(slope(used));
M=find(slope==Ms);
T=M(end)+1;