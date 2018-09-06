figure
found=0;
while ~found
    R=ceil(rand*length(FXYCMS));
    fxyc=FXYCMS{R};
    if length(fxyc(1,:))==9
        found=1;
    end
end
    
fxyc=FXYCMS{R};
subplot(2,2,1)
plot(fxyc(:,6))
subplot(2,2,2)
plot(fxyc(:,7))
subplot(2,2,3)
plot(fxyc(:,8))
subplot(2,2,4)
plot(fxyc(:,9))