function [X,names]=NSTA2Mat(NSTA)

names=fieldnames(NSTA);
T=length(NSTA);
for i=1:length(names)
    for i2=1:T
        X(i2,i)=NSTA(i2).(names{i})(1);
    end
end