for i=1:length(Mc)
    MATc(i)=median(Mc{i});
    SATc(i)=median(Sc{i});
end
for i=1:length(Mo)
    MATo(i)=median(Mo{i});
    SATo(i)=median(So{i});
end
figure
subplot(1,2,1)
plot(MATc/MATc(1),'g')
hold on
plot(MATo/MATo(1),'r')
xlim([.5 5.5])
ylabel('Median AP2 Intensity')
xlabel('Stack #')
YL=ylim;
line([2.1 2.1],YL,'Color','b')
subplot(1,2,2)
plot(SATc/SATc(1),'g')
hold on
plot(SATo/SATo(1),'r')
xlim([.5 5.5])
ylabel('Median CLCa Intensity')
xlabel('Stack #')
YL=ylim;
line([2.1 2.1],YL,'Color','b')

%%
for i=1:length(Mc)
    MATc(i)=median(Mc{i});
    SATc(i)=median(Sc{i});
    LMATc(i)=length(Mc{i});
    LSATc(i)=length(Sc{i});
end
for i=1:length(Mo)
    MATo(i)=median(Mo{i});
    SATo(i)=median(So{i});
    LMATo(i)=length(Mo{i});
    LSATo(i)=length(So{i});
end
figure

subplot(1,3,1)
plot(MATc/MATc(1),'g')
hold on
plot(MATo/MATo(1),'r')
xlim([.5 5.5])
ylabel('Mean AP2 Intensity')
xlabel('Stack #')
YL=ylim;
line([2.1 2.1],YL,'Color','b')

subplot(1,3,2)
plot(SATc/SATc(1),'g')
hold on
plot(SATo/SATo(1),'r')
xlim([.5 5.5])
ylabel('Mean CLCa Intensity')
xlabel('Stack #')
YL=ylim;
line([2.1 2.1],YL,'Color','b')

subplot(1,3,3)
plot(LMATc/4,'g')
hold on
plot(LMATo/11,'r')
xlim([.5 5.5])
ylabel('# Spots Per Movie')
xlabel('Stack #')
ylim([0 270])
YL=ylim;
line([2.1 2.1],YL,'Color','b')

%%
for i=1:length(Mc)
    MATc(i)=median(Mc{i});
    SATc(i)=median(Sc{i});
    LMATc(i)=length(Mc{i});
    LSATc(i)=length(Sc{i});
end
for i=1:length(Mo)
    MATo(i)=median(Mo{i});
    SATo(i)=median(So{i});
    LMATo(i)=length(Mo{i});
    LSATo(i)=length(So{i});
end
figure

subplot(1,3,1)
%plot(MATc/MATc(1),'g')
%hold on
plot(MATo/MATo(1)-MATc/MATc(1),'r')
hold on
xlim([.5 5.5])
ylabel('Median AP2 Intensity (Subtracted from control)')
xlabel('Stack #')
YL=ylim;
line([2.1 2.1],YL,'Color','b')

subplot(1,3,2)
% plot(SATc/SATc(1),'g')
% hold on
plot(SATo/SATo(1)-SATc/SATc(1),'r')
hold on
xlim([.5 5.5])
ylabel('Median CLCa Intensity (Subtracted from control)')
xlabel('Stack #')
YL=ylim;
line([2.1 2.1],YL,'Color','b')

subplot(1,3,3)
% plot(LMATc/4,'g')
% hold on
plot(LMATo/11./(LMATc/4),'r')
hold on
xlim([.5 5.5])
ylabel('# Spots Per Movie (Relative to control)')
xlabel('Stack #')
%ylim([0 270])
YL=ylim;
line([2.1 2.1],YL,'Color','b')