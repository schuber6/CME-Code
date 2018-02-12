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
for i=1:length(Time)
    Peak=Time{i}(find(Int{i}==max(Int{i})));
    if Peak<198
        GoodBefore=[GoodBefore i];
    else
        if Peak<391
            GoodDuring=[GoodDuring i];
        else
            GoodAfter=[GoodAfter i];
        end
    end
end
TimeShift=CenterByPeak(Time,Int);
% for i=1:length(GoodBefore)
%     plot(TimeShift{GoodBefore(i)},Int{GoodBefore(i)},'b')
%     hold on
% end
% xlabel('Time from Peak (s)')
% ylabel('Intensity (AU)')
% title('Before Squeezing')
Sumb=zeros(1,301);
for i=-150:150
    T(i+151)=i;
end
% for i=1:length(GoodBefore)
%     for i2=-150:150
%         found=find(TimeShift{GoodBefore(i)}==i2);
%         if ~isempty(found)
%             Sumb(i2+151)=Sumb(i2+151)+Int{GoodBefore(i)}(found(1));
%         end
%     end
% end
% Avb=Sumb/length(GoodBefore);
% plot(T,Avb,'g')
% hold on
% xlabel('Time from Peak (s)')
% ylabel('Intensity (AU)')
% title('Average Traces (Green-Before Squeezing, Blue-During Squeezing, Red-After Squeezing)')
% 
% Sumd=zeros(1,301);
% for i=-150:150
%     T(i+151)=i;
% end
% for i=1:length(GoodDuring)
%     for i2=-150:150
%         found=find(TimeShift{GoodDuring(i)}==i2);
%         if ~isempty(found)
%             Sumd(i2+151)=Sumd(i2+151)+Int{GoodDuring(i)}(found(1));
%         end
%     end
% end
% Avd=Sumd/length(GoodDuring);
% plot(T,Avd,'b')
% hold on
% 
% Suma=zeros(1,301);
% for i=-150:150
%     T(i+151)=i;
% end
% for i=1:length(GoodAfter)
%     for i2=-150:150
%         found=find(TimeShift{GoodAfter(i)}==i2);
%         if ~isempty(found)
%             Suma(i2+151)=Suma(i2+151)+Int{GoodAfter(i)}(found(1));
%         end
%     end
% end
% Ava=Suma/length(GoodAfter);
% plot(T,Ava,'r')
% hold on

Sumt=zeros(1,301);
for i=-150:150
    T(i+151)=i;
end
for i=1:length(Time)
    for i2=-150:150
        found=find(TimeShift{i}==i2);
        if ~isempty(found)
            Sumt(i2+151)=Sumt(i2+151)+Int{i}(found(1));
        end
    end
end
Avt=Sumt/length(Time);
plot(T,Avt,'b')
hold on

xlabel('Time from Peak (s)')
ylabel('Intensity (AU)')
title('Average Traces')



