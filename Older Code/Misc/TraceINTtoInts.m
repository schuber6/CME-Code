function [Ints,Frames]=TraceINTtoInts(TraceINT)

[A,B]=size(TraceINT);
for i=1:A
    used=find(TraceINT(i,:));
    Frames{i}=used.';
    Ints{i}=TraceINT(i,used).';
end