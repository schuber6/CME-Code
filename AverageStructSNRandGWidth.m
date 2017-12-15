function [back,SNR,GWx,GWy]=AverageStructSNRandGWidth(AS)

[A,B]=size(AS);
back=0;
num=0;
for i=1:A
    for i2=1:B
        if i==1 || i2==1 || i==A || i2==B
            num=num+1;
            back=back+AS(i,i2);
        end
    end
end
back=back/num;
SNR=max(max(AS))/back;
c = twoDgaussianFittingUnConstrained(AS);
GWx=c(5);
GWy=c(6);