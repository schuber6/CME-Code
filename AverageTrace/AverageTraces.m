function AV=AverageTraces(T1,T2)

if length(T1)>length(T2)
    L=T1;
    S=T2;
else
    L=T2;
    S=T1;
end
S=[S ; zeros(length(L)-length(S),1)];
AV=(S+L)/2;