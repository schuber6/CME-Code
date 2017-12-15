function [start,leng]=FindLongestRun(X)
%Finds longest string of consecutive integers in vector X and gives the
%index of the first one and the length of the string
D=diff(X);
leng=0;
start=0;
currL=0;
currS=0;
for i=1:length(D)
    if D(i)==1
        if currL==0
            currS=i;
            currL=1;
        end
        currL=currL+1;
    else
        currL=0;
    end
    if currL>leng
        leng=currL;
        start=currS;
    end
end
