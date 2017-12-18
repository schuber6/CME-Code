clear all
figure
for i=1:21
    exposure=.15;
    planes=7;
    GFP(i)=exp((i-1)*exposure*planes/-120);
    RFP(i)=exp((i-1)*exposure*planes/-60);
end
plot(GFP,'g')
hold on
plot(RFP,'r')
plot(GFP./RFP,'b')