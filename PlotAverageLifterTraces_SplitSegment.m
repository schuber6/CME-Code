function PlotAverageLifterTraces_SplitSegment(Lifters,Flat,Sinkers,NSTA,inds,NF,fg,zg)

MinP=0;
MaxP=70;
MinO=100;
MaxO=170;

AvLifterPi=cell(1,NF);
AvSinkerPi=cell(1,NF);
AvFlatPi=cell(1,NF);
AvLifterOi=cell(1,NF);
AvSinkerOi=cell(1,NF);
AvFlatOi=cell(1,NF);

AvLifterPz=cell(1,NF);
AvSinkerPz=cell(1,NF);
AvFlatPz=cell(1,NF);
AvLifterOz=cell(1,NF);
AvSinkerOz=cell(1,NF);
AvFlatOz=cell(1,NF);

AvLifterPf=cell(1,NF); %Not necessary, just to sanity check
AvSinkerPf=cell(1,NF);
AvFlatPf=cell(1,NF);
AvLifterOf=cell(1,NF);
AvSinkerOf=cell(1,NF);
AvFlatOf=cell(1,NF);


for i=1:length(Lifters)
    I=inds(Lifters(i));
    Fr=max(NSTA(I).frame);
    if Fr>MinP && Fr<=MaxP 
        used=find(NSTA(I).frame,NF,'last');
        for i2=1:length(used)
            AvLifterPi{i2}=[AvLifterPi{i2} NSTA(I).int(used(i2))];
            AvLifterPz{i2}=[AvLifterPz{i2} NSTA(I).st(used(i2))];
            AvLifterPf{i2}=[AvLifterPf{i2} NSTA(I).frame(used(i2))];
        end
    end
    if Fr>MinO && Fr<=MaxO
        used=find(NSTA(I).frame,NF,'last');
        for i2=1:length(used)
            AvLifterOi{i2}=[AvLifterOi{i2} NSTA(I).int(used(i2))];
            AvLifterOz{i2}=[AvLifterOz{i2} NSTA(I).st(used(i2))];
            AvLifterOf{i2}=[AvLifterOf{i2} NSTA(I).frame(used(i2))];
        end
    end
end

for i=1:length(Sinkers)
    I=inds(Sinkers(i));
    Fr=max(NSTA(I).frame);
    if Fr>MinP && Fr<=MaxP 
        used=find(NSTA(I).frame,NF,'last');
        for i2=1:length(used)
            AvSinkerPi{i2}=[AvSinkerPi{i2} NSTA(I).int(used(i2))];
            AvSinkerPz{i2}=[AvSinkerPz{i2} NSTA(I).st(used(i2))];
            AvSinkerPf{i2}=[AvSinkerPf{i2} NSTA(I).frame(used(i2))];
        end
    end
    if Fr>MinO && Fr<=MaxO
        used=find(NSTA(I).frame,NF,'last');
        for i2=1:length(used)
            AvSinkerOi{i2}=[AvSinkerOi{i2} NSTA(I).int(used(i2))];
            AvSinkerOz{i2}=[AvSinkerOz{i2} NSTA(I).st(used(i2))];
            AvSinkerOf{i2}=[AvSinkerOf{i2} NSTA(I).frame(used(i2))];
        end
    end
end

for i=1:length(Flat)
    I=inds(Flat(i));
    Fr=max(NSTA(I).frame);
    if Fr>MinP && Fr<=MaxP 
        used=find(NSTA(I).frame,NF,'last');
        for i2=1:length(used)
            AvFlatPi{i2}=[AvFlatPi{i2} NSTA(I).int(used(i2))];
            AvFlatPz{i2}=[AvFlatPz{i2} NSTA(I).st(used(i2))];
            AvFlatPf{i2}=[AvFlatPf{i2} NSTA(I).frame(used(i2))];
        end
    end
    if Fr>MinO && Fr<=MaxO
        used=find(NSTA(I).frame,NF,'last');
        for i2=1:length(used)
            AvFlatOi{i2}=[AvFlatOi{i2} NSTA(I).int(used(i2))];
            AvFlatOz{i2}=[AvFlatOz{i2} NSTA(I).st(used(i2))];
            AvFlatOf{i2}=[AvFlatOf{i2} NSTA(I).frame(used(i2))];
        end
    end
end

for i=1:NF
    mAvLifterPi(i)=mean(AvLifterPi{i});
    mAvSinkerPi(i)=mean(AvSinkerPi{i});
    mAvFlatPi(i)=mean(AvFlatPi{i});
    mAvLifterOi(i)=mean(AvLifterOi{i});
    mAvSinkerOi(i)=mean(AvSinkerOi{i});
    mAvFlatOi(i)=mean(AvFlatOi{i});
    
    mAvLifterPz(i)=mean(AvLifterPz{i});
    mAvSinkerPz(i)=mean(AvSinkerPz{i});
    mAvFlatPz(i)=mean(AvFlatPz{i});
    mAvLifterOz(i)=mean(AvLifterOz{i});
    mAvSinkerOz(i)=mean(AvSinkerOz{i});
    mAvFlatOz(i)=mean(AvFlatOz{i});
    
    mAvLifterPf(i)=mean(AvLifterPf{i}); %Not necessary, just to sanity check
    mAvSinkerPf(i)=mean(AvSinkerPf{i});
    mAvFlatPf(i)=mean(AvFlatPf{i});
    mAvLifterOf(i)=mean(AvLifterOf{i});
    mAvSinkerOf(i)=mean(AvSinkerOf{i});
    mAvFlatOf(i)=mean(AvFlatOf{i});
    T(i)=(NF-i)*fg;
end
figure
subplot(1,2,1)
plot(T,mAvLifterPi,'g')
hold on
plot(T,mAvFlatPi,'b')
plot(T,mAvSinkerPi,'r')

title('Before Osmoshock')
ylabel('Average Intensity')
xlabel('Time From End of Trace (s)')
legend(strcat('Lifters: N=',num2str(length(AvLifterPi{1}))),strcat('Flats: N=',num2str(length(AvFlatPi{1}))),strcat('Sinkers: N=',num2str(length(AvSinkerPi{1}))))
YL1=ylim;
subplot(2,2,2)
plot(T,mAvLifterOi,'g')
hold on
plot(T,mAvFlatOi,'b')
plot(T,mAvSinkerOi,'r')


title('After Osmoshock')
legend(strcat('Lifters: N=',num2str(length(AvLifterOi{1}))),strcat('Flats: N=',num2str(length(AvFlatOi{1}))),strcat('Sinkers: N=',num2str(length(AvSinkerOi{1}))))
YL2=ylim;
YL=[min([YL1(1) YL2(1)]) max([YL1(2) YL2(2)])];
subplot(2,2,1)
ylim(YL)
subplot(2,2,2)
ylim(YL)

offset=median(mAvFlatPz)*zg;

subplot(1,2,2)
plot(T,mAvLifterPz*zg-offset,'g')
hold on
plot(T,mAvSinkerPz*zg-offset,'r')
plot(T,mAvFlatPz*zg-offset,'b')
ylabel('Average Z Position (nm from median, pre-osmoshock flat position)')
YL1=ylim;

subplot(2,2,4)
plot(T,mAvLifterOz*zg-offset,'g')
hold on
plot(T,mAvSinkerOz*zg-offset,'r')
plot(T,mAvFlatOz*zg-offset,'b')
YL2=ylim;

YL=[min([YL1(1) YL2(1)]) max([YL1(2) YL2(2)])];
subplot(2,2,3)
ylim(YL)
subplot(2,2,4)
ylim(YL)

% 
% subplot(3,2,5)
% plot(T,mAvLifterPf,'g')
% hold on
% plot(T,mAvSinkerPf,'r')
% plot(T,mAvFlatPf,'b')
% ylabel('Average Frame')
% 
% subplot(3,2,6)
% plot(T,mAvLifterOf,'g')
% hold on
% plot(T,mAvSinkerOf,'r')
% plot(T,mAvFlatOf,'b')