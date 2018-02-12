function lifetimes=TabulateAllLifetimesFXYC(Threshfxyc,FrameGap)


lifetimes=[];
for i=1:length(Threshfxyc(1,1,:))
    if Threshfxyc(1,4,i)==3
        lifetimes=[lifetimes length(find(Threshfxyc(:,1,i)))*FrameGap];
    end
end