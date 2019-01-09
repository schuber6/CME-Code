found=false;
while ~found
    R=ceil(rand*length(N));
    if max(N(R).int)>=1000 && max(N(R).SlaveBS)>=400 && length(N(R).frame)>=10
        found=true;
    end
end
figure
t=1:length(N(R).frame);
t=t*4;
subplot(1,2,1)
plot(t,N(R).int,'g')
subplot(1,2,2)
plot(t,N(R).SlaveBS,'r')
