function N=CountPlaneMaxima(W)

N=zeros(1,6);
for i=1:length(W{1})
    Ints=[W{1}(i) W{2}(i) W{3}(i) W{4}(i) W{5}(i) W{6}(i)];
    M=find(Ints==max(Ints),1,'first');
    if max(Ints)>1000
    N(M)=N(M)+1;
    end
end
    