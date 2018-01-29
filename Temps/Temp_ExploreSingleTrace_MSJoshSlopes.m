Dm=JFm_ac{1};
Ds=JFs_ac{1};
N=length(Dm);
xbins=-1:.05:1;
%figure
ind1=1;
for i=1:length(Dm)
    found=0;
    %while ~found
       % T=ceil(rand*N);
       T=i;
        if length(Dm{T})>=10 && length(Dm{T})<=36
            %found=1;
            C(ind1)=corr(Dm{T}.',Ds{T}.');
            ind1=ind1+1;
        end
    %end
    %subplot(5,5,i)
    %scatter(Dm{T},Ds{T})
    
  
end
%figure
H1=hist(C,xbins);

Dm=JFm_cc{1};
Ds=JFs_cc{1};
N=length(Dm);
ind2=1;
%figure
for i=1:length(Dm)
    found=0;
    %while ~found
        %T=ceil(rand*N);
        T=i;
        if length(Dm{T})>=10 && length(Dm{T})<=36
            %found=1;
            C2(ind2)=corr(Dm{T}.',Ds{T}.');
            ind2=ind2+1;
        end
    %end
    %subplot(5,5,i)
    %scatter(Dm{T},Ds{T})
    %C2(i)=corr(Dm{T}.',Ds{T}.');
  
end
figure
H2=hist(C2,xbins);

plot(xbins,H1/sum(H1),'b')
hold on
plot(xbins,H2/sum(H2),'r')