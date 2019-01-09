function M=MaxFrameFXYC(fxyc)

M=0;
for i=1:length(fxyc(1,1,:))
    M=max(M,max(fxyc(:,1,i)));
end