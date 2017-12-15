Good=find(Threshfxyc(1,4,:)==3);
Time=cell(1,length(Good));
for i=1:length(Good)
    used=find(Threshfxyc(:,1,Good(i)));
    for i2=1:length(used)
        Time{i}(i2)=Threshfxyc(used(i2),1,Good(i));
        Int{i}(i2)=Threshfxyc(used(i2),5,Good(i));
    end
end
GoodBefore=[];
GoodDuring=[];
GoodAfter=[];
Window=20;
Frames=max(max(Threshfxyc(:,1,:)));
RollingWindow=cell(1,Frames)
RollingAvPeakSum=zeros(1,Frames);
RollingAvCount=zeros(1,Frames);
PeakCount=zeros(1,Frames);
for i=1:length(Time)
    Peak=Time{i}(find(Int{i}==max(Int{i})));
    PeakCount(Peak)=PeakCount(Peak)+1;
    PeakInt=max(Int{i});
    for i2=max(1,Peak-Window):Peak
        RollingAvCount(i2)=RollingAvCount(i2)+1;
        RollingAvPeakSum(i2)=RollingAvPeakSum(i2)+PeakInt;
        RollingWindow{i2}=[RollingWindow{i2} PeakInt];
    end
    
end
for i=1:Frames
    RollingAvPeak(i)=RollingAvPeakSum(i)/RollingAvCount(i);
    RollingMedian(i)=median(RollingWindow{i});
    sorted=sort(RollingWindow{i});
    max5=find(sorted,5,'Last');
    Maxmean(i)=mean(sorted(max5));
end
plot(RollingAvPeak,'b')
hold on
plot(RollingAvCount,'g')
% plot(RollingMedian,'r')
% plot(Maxmean,'g')
plot([143 143],get(gca,'ylim'))
plot([321 321],get(gca,'ylim'))
xlabel('Time (s)')
ylabel('Average Peak Intensity')