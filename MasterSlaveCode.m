start=500;  %Plot grid of 25 master slave int curves
for i=start:start+24
    subplot(5,5,i-start+1)
    plot(MSD{i}(:,4),'g')
    hold on
    plot(MSD{i}(:,5),'r')
end

%% Plot difference in Master and slave positions

plot(MSD{40}(:,2)-MSD{40}(:,6))
hold on
plot(MSD{40}(:,3)-MSD{40}(:,7),'r')

%% Plot Slave sd's

plot(MSD{13}(:,9))
hold on
plot(MSD{13}(:,10))

%% Hist all slave sd's
sdx=[];
sdy=[];
for i=1:length(MSD)
    for i2=1:length(MSD{i}(:,1))
        sdx=[sdx MSD{i}(i2,9)];
        sdy=[sdy MSD{i}(i2,10)];
    end
end
hist(sdx,100)
title('sdx')
figure
hist(sdy,100)
title('sdy')

%% Hist all slave position differences

dx=[];
dy=[];
for i=1:length(MSD)
    for i2=1:length(MSD{i}(:,1))
        dx=[dx MSD{i}(i2,6)-MSD{i}(i2,2)];
        dy=[dy MSD{i}(i2,7)-MSD{i}(i2,3)];
    end
end
hist(dx,100)
title('dx')
figure
hist(dy,100)
title('dy')
mean(dx)
mean(dy)
sqrt(var(dx))
sqrt(var(dy))
median(dx)
median(dy)

%% Make flag matrix detailing which slave fits are likely bad and for what reason

LboundSDX=.25;
LboundSDY=.25;
UboundSDX=2.5;
UboundSDY=2.5;
AboundDX=2;
AboundDY=2;
trace=517;
Flags=zeros(length(MSD{trace}(:,1)),6);
for i=1:length(MSD{trace}(:,1))
    if MSD{trace}(i,9)<LboundSDX
        Flags(i,1)=1;
    end
    if MSD{trace}(i,9)>UboundSDX
        Flags(i,2)=1;
    end
    if MSD{trace}(i,10)<LboundSDY
        Flags(i,3)=1;
    end
    if MSD{trace}(i,10)>UboundSDY
        Flags(i,4)=1;
    end
    if abs(MSD{trace}(i,2)-MSD{trace}(i,6))>AboundDX
        Flags(i,5)=1;
    end
    if abs(MSD{trace}(i,3)-MSD{trace}(i,7))>AboundDY
        Flags(i,6)=1;
    end
    Flags(i,7)=max(Flags(i,:));
end

%% Replace flagged slave ints with 0s in a single trace
trace=40;
plot(MSD{trace}(:,4),'g')
hold on
FINT=RemoveFlaggedInts(Flags,MSD,trace);
plot(FINT(:,2),FINT(:,1),'r')

%% Tabulate how many DNR bursts are <window frames before given frame
Window=20;
F=max(events(:,1));
BurstsA=zeros(1,F);
for i=1:length(events(:,1))
    f=events(i,1);
    for i2=1:min(Window,F-f+1)
        BurstsA(f+i2-1)=BurstsA(f+i2-1)+1;
    end
end
%% Plot average DNR/CLTA traces in the neighborhood of disappearances separately for before, during, and after squishing
Start=198;
Finish=444;
CompIntMasterB=cell(1,20);
CompIntSlaveB=cell(1,20);
CompIntMasterD=cell(1,20);
CompIntSlaveD=cell(1,20);
CompIntMasterA=cell(1,20);
CompIntSlaveA=cell(1,20);
for i=1:length(events(:,1))
    if events(i,1)<Start
        for i2=1:20
            ind=find(MSD{events(i,4)}(:,1)==events(i,1)+i2-5-1);
            if ~isempty(ind)
                CompIntMasterB{i2}=[CompIntMasterB{i2} MSD{events(i,4)}(ind(1),4)];
                CompIntSlaveB{i2}=[CompIntSlaveB{i2} MSD{events(i,4)}(ind(1),5)];
            end
        end
    end
    if events(i,1)>=Start && events(i,1)<=Finish
        for i2=1:20
            ind=find(MSD{events(i,4)}(:,1)==events(i,1)+i2-5-1);
            if ~isempty(ind)
                CompIntMasterD{i2}=[CompIntMasterD{i2} MSD{events(i,4)}(ind(1),4)];
                CompIntSlaveD{i2}=[CompIntSlaveD{i2} MSD{events(i,4)}(ind(1),5)];
            end
        end
    end
    if events(i,1)>Finish
        for i2=1:20
            ind=find(MSD{events(i,4)}(:,1)==events(i,1)+i2-5-1);
            if ~isempty(ind)
                CompIntMasterA{i2}=[CompIntMasterA{i2} MSD{events(i,4)}(ind(1),4)];
                CompIntSlaveA{i2}=[CompIntSlaveA{i2} MSD{events(i,4)}(ind(1),5)];
            end
        end
    end
end

for i=1:20
    MasterAA(i)=mean(CompIntMasterA{i});
    SlaveAA(i)=mean(CompIntSlaveA{i});
    MasterAD(i)=mean(CompIntMasterD{i});
    SlaveAD(i)=mean(CompIntSlaveD{i});
    MasterAB(i)=mean(CompIntMasterB{i});
    SlaveAB(i)=mean(CompIntSlaveB{i});
end
subplot(1,3,1)
plot(MasterAB,'g')
hold on
plot(SlaveAB,'r')
xlabel('Frame in Disappearence')
ylabel('Average Trace Intensity')
title('Before Squishing')
ylim([0 1300])
subplot(1,3,2)
plot(MasterAD,'g')
hold on
plot(SlaveAD,'r')
xlabel('Frame in Disappearence')
ylabel('Average Trace Intensity')
title('During Squishing')
ylim([0 1300])
subplot(1,3,3)
plot(MasterAA,'g')
hold on
plot(SlaveAA,'r')
xlabel('Frame in Disappearence')
ylabel('Average Trace Intensity')
title('After Squishing')
ylim([0 1300])

%% Record how much DNR and CLTA signals dropped during disappearance events
DNRdrop=[];
CLTAdrop=[];
for i=1:length(events(:,1))
%     before=find(MSD{events(i,4)}(:,1)==events(i,1));
%     after=find(MSD{events(i,4)}(:,1)==events(i,1)+6);
%     
%     if isempty(after)
%         L=length(MSD{events(i,4)}(:,1));
%         time=zeros(1,L)+50;
%         for i2=1:L
%             time(i2)=abs(MSD{events(i,4)}(i2,1)-(events(i,1)+6));
%         end
%         after=find(time==min(time));
%     end
    [before,after]=FindMaxDisappearance(events(i,1),MSD{events(i,4)});
    DNRdrop=[DNRdrop;[MSD{events(i,4)}(before(1),4)-MSD{events(i,4)}(after(1),4) events(i,1)]];
    CLTAdrop=[CLTAdrop;[MSD{events(i,4)}(before(1),5)-MSD{events(i,4)}(after(1),4) events(i,1)]];
end

%% Find all DNR drops for disappearances <window frames before given frame

Window=20;
F=max(events(:,1));
DNRdropA=cell(1,F);
for i=1:length(DNRdrop(:,1))
    f=DNRdrop(i,2);
    for i2=1:Window
        if f+i2-1<=F
            DNRdropA{f+i2-1}=[DNRdropA{f+i2-1} DNRdrop(i,1)];
        end
    end
end

%% Find all CLTA drops for disappearances <window frames before given frame
Window=20;
F=max(events(:,1));
CLTAdropA=cell(1,F);
for i=1:length(CLTAdrop(:,1))
    f=CLTAdrop(i,2);
    for i2=1:Window
        if f+i2-1<=F
            CLTAdropA{f+i2-1}=[CLTAdropA{f+i2-1} CLTAdrop(i,1)];
        end
    end
end

%% Plot average DNR/CLTA drops vs frame
for i=1:length(DNRdropA)
    DNRdropAv(i)=mean(DNRdropA{i});
end
for i=1:length(CLTAdropA)
    CLTAdropAv(i)=mean(CLTAdropA{i});
end
plot(DNRdropAv,'g')
hold on
plot(CLTAdropAv,'r')
ylabel('Average Drop in Intensity Over DNR Disappearence')
xlabel('Frame')
title('S007')
%% Plot total DNR/CLTA drops vs frame
for i=1:length(DNRdropA)
    DNRdropAv(i)=sum(DNRdropA{i});
end
for i=1:length(CLTAdropA)
    CLTAdropAv(i)=sum(CLTAdropA{i});
end
plot(DNRdropAv,'g')
hold on
plot(CLTAdropAv,'r')
ylabel('Total Drop in Intensity Over DNR Disappearence')
xlabel('Frame')
title('007')

%% Plot total DNR/CLTA drops vs frame Normalized for photobleaching by total frame intensity
for i=1:length(DNRdropA)
    DNRdropAvbc(i)=sum(DNRdropA{i})/(DNR_FIbc(i)/max(DNR_FIbc));
end
for i=1:length(CLTAdropA)
    CLTAdropAvbc(i)=sum(CLTAdropA{i})/(CLTA_FIbc(i)/max(CLTA_FIbc));
end
plot(DNRdropAvbc/max(DNRdropAvbc),'g')
hold on
plot(CLTAdropAvbc/max(CLTAdropAvbc),'r')
ylabel('Total Drop in Intensity Over DNR Disappearence (Normalized for Photobleaching)')
xlabel('Frame')
title('S007')

%% Plot mean DNR/CLTA drops vs frame Normalized for photobleaching by total frame intensity
for i=1:length(DNRdropA)
    DNRdropAvbc(i)=mean(DNRdropA{i})/(DNR_FIbc(i)/max(DNR_FIbc));
end
for i=1:length(CLTAdropA)
    CLTAdropAvbc(i)=mean(CLTAdropA{i})/(CLTA_FIbc(i)/max(CLTA_FIbc));
end
plot(DNRdropAvbc/max(DNRdropAvbc),'g')
hold on
plot(CLTAdropAvbc/max(CLTAdropAvbc),'r')
ylabel('Mean Drop in Intensity Over DNR Disappearence (Normalized for Photobleaching)')
xlabel('Frame')
title('S007')


