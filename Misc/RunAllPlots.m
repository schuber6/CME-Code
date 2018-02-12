function RunAllPlots(MSD,events,fileMaster,fileSlave)
%Makes all DNR/CLTA plots from MSD,events,DNR_FIbc,CLTA_FIbc

name='S005 From 1217';
SQstart=124;
SQend=542;

DNR_FI=FindTotalIntensityVsFrame(fileMaster);
CLTA_FI=FindTotalIntensityVsFrame(fileSlave);
DNR_BI=FindBackground(fileMaster);
CLTA_BI=FindBackground(fileSlave);
DNR_FIbc=DNR_FI-mean(DNR_BI);
CLTA_FIbc=CLTA_FI-mean(CLTA_BI);

% Hist all slave sd's
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

figure
% Hist all slave position differences
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

figure
% Plot average DNR/CLTA traces in the neighborhood of disappearances separately for before, during, and after squishing
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

% Record how much DNR and CLTA signals dropped during disappearance events
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

% Find all DNR drops for disappearances <window frames before given frame
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

% Find all CLTA drops for disappearances <window frames before given frame
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

figure
% Plot average DNR/CLTA drops vs frame
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
title(name)

figure
% Plot total DNR/CLTA drops vs frame
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
title(name)

figure
% Plot total DNR/CLTA drops vs frame Normalized for photobleaching by total frame intensity
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
title(name)

figure
% Plot mean DNR/CLTA drops vs frame Normalized for photobleaching by total frame intensity
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
line([SQend SQend],ylim,'Color',[1 0 0])
line([SQstart SQstart],ylim,'Color',[0 1 0])
title(name)

figure
% Plot number disappearances vs frame
for i=1:length(DNRdropA)
    DNRdropAv(i)=length(DNRdropA{i});
end
plot(DNRdropAv)
hold on
ylabel('Number of DNR Disappearances within 20 s')
xlabel('Frame')
line([SQend SQend],ylim,'Color',[1 0 0])
line([SQstart SQstart],ylim,'Color',[0 1 0])
title(name)

figure
% Plot mean DNR lifetime vs frame
EventLifetimes=FindEventLifetimes(events,MSD);
Window=20;
F=max(events(:,1));
LifetimeA=cell(1,F);
for i=1:length(EventLifetimes)
    f=events(i,1);
    for i2=1:Window
        if f+i2-1<=F
            LifetimeA{f+i2-1}=[LifetimeA{f+i2-1} EventLifetimes(i)];
        end
    end
end
for i=1:length(LifetimeA)
    LifetimeMean(i)=mean(LifetimeA{i});
end
plot(LifetimeMean)
hold on
xlabel('Time (s)')
ylabel('Average Lifetime of DNR spots within 20 s')
line([SQend SQend],ylim,'Color',[1 0 0])
line([SQstart SQstart],ylim,'Color',[0 1 0])
title(name)

figure
% Plot mean DNR max intensity
MaxInts=FindMaxInt(events,MSD);
Window=20;
F=max(events(:,1));
MaxIntA=cell(1,F);
for i=1:length(MaxInts)
    f=events(i,1);
    for i2=1:Window
        if f+i2-1<=F
            MaxIntA{f+i2-1}=[MaxIntA{f+i2-1} MaxInts(i)];
        end
    end
end
for i=1:length(MaxIntA)
    MaxIntMean(i)=mean(MaxIntA{i});
end
plot(MaxIntMean)
hold on
xlabel('Time (s)')
ylabel('Average Max Intensity of DNR spots within 20 s')
ylim([0 max(MaxIntMean)*1.1])
line([SQend SQend],ylim,'Color',[1 0 0])
line([SQstart SQstart],ylim,'Color',[0 1 0])
title(name)