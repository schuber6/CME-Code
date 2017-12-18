function A=Log0(A)
%Returns log unless value is 0--then returns 0
[a,b]=size(A);
for i=1:a
    for i2=1:b
        if A(i,i2)~=0
            A(i,i2)=log(A(i,i2));
        end
    end
end