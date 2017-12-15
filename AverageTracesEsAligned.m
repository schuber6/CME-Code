function [Sav,Mav,Rav]=AverageTracesEsAligned(MSD,Es)

Window=40;
SavL=cell(1,Window);
MavL=cell(1,Window);
RavL=cell(1,Window);
ST=400;
RatioT=.5;
RatioMax=5;
for i=1:length(MSD)
    %L=length(MSD{i}(:,1));
    L=Es(i);
    MS=max(MSD{i}(:,5));
    MM=max(MSD{i}(:,4));
    if MS>=ST && MM/MS>=RatioT && MM/MS<=RatioMax
        for i2=1:min([L Window])
            SavL{i2}=[SavL{i2} MSD{i}(L+1-i2,5)];
            MavL{i2}=[MavL{i2} MSD{i}(L+1-i2,4)];
            RavL{i2}=[RavL{i2} MSD{i}(L+1-i2,4)/MSD{i}(L+1-i2,5)];
        end
    end
end
for i=1:Window
    Sav(i)=median(SavL{i});
    Mav(i)=median(MavL{i});
    Rav(i)=median(RavL{i});
    F(i)=i-1;
end
figure
plot(F,Sav,'r')
hold on
plot(F,Mav,'g')
%plot(F,Rav,'b')
xlabel('Frames from end of trace')
ylabel('Intensity (AU)')
legend('Average Dynamin Trace','Average AP2 Trace')