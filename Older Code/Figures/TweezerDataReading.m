ForceFile='Z:\Scott\Optical Tweezers\9_23_Flow4_B4\QPDdata\analysis_QPD1\ForceData.xlsx';
Data=xlsread(ForceFile);
%%

figure
plot(Data(:,1),Data(:,2))

%%
clear Avt Avx Avy AvF
Ze=[-1.14 -.618];
used=find(Data(:,1)>=50 & Data(:,1)<=140);
Window=20;
Avt=[];
Avx=[];
Avy=[];
AvF=[];
for i=1:floor(length(used)/Window)-1
    I=i*Window;
    Avt(i)=median(Data(used(I:I+Window-1),1));
    Avx(i)=median(Data(used(I:I+Window-1),2));
    Avy(i)=median(Data(used(I:I+Window-1),3));
    AvF(i)=norm([Avx(i)-Ze(1) Avy(i)-Ze(2)]);
end
figure
plot(Avt,AvF)
xlabel('Time (s)')
ylabel('Force (pN)')
%%
save('83_1_1_CycloForces.mat','Avt','AvF')

%%
fold='Z:\Scott';
files=FindFiles(fold,'*CycloForces*');
Data=[];
for i=1:length(files)
    load(files{i})
    Ze(i)=median(AvF(1:3));
    ZeT(i)=Avt(i);
    for i2=1:length(Avt)
        Data=[Data ; [Avt(i2)-ZeT(i) AvF(i2)/Ze(i)]];
    end
end

%%

figure
scatter(Data(:,1),Data(:,2))

%%
clear std Men T Te stdev
Window=200;
for i=1:floor(max(Data(:,1))/Window)-1
    T(i)=(i-1)*Window;
    Te(i)=i*Window;
    used=find(Data(:,1)>=T(i) & Data(:,1)<Te(i));
    Men(i)=mean(Data(used,2));
    stdev(i)=std(Data(used,2));
end

%%

figure
errorbar(T,Men,stdev)

%%

figure
Obj=PlotShadedErrorBars(T/60,Men,stdev,'b',[]);
xlim([0 2800/60])
ylim([.5 1.5])
xlabel('Time (min)')
ylabel('Tether Force (Relative to first measurement)')
yticks(.5:.25:1.5)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',12)

%%
clear Avt Avx Avy AvF
Ze=[-1.14 -.618];
Wind{1}=[56.25 58.25];
Wind{2}=[70 72];
Wind{3}=[85 88];
Wind{4}=[100 105];
Wind{5}=[129.5 133];
WF=[.03 .06 .12 .25 .3];
S=[];
for i=1:length(Wind)
    used=find(Data(:,1)>=Wind{i}(1) & Data(:,1)<=Wind{i}(2));
    for i2=1:length(used)
        fx=Data(used(i2),2);
        fy=Data(used(i2),3);
        FT=norm([fx-Ze(1) fy-Ze(2)]);
        C{i}(i2)=FT;
        S=[S ; [WF(i) FT]];
    end
end
figure
% BoxPlotCell(C)
%scatter(S(:,1),S(:,2))
boxplot(S(:,2),S(:,1),'positions',S(:,1))
hold on
AddLinearRegLine_Color_0Intercept(S(:,1).',S(:,2).','r')
xlabel('Flow Rate (mL/min)')
ylabel('Measured Force (pN)')

%%
LR=WF*28.116;
Med=StatCell_Fancy(C,@mean);
pE=(LR-Med)./Med;
pE

%%

E1=[6.94 12.71 11.21 10.17 11.35 7.81 10.56];
E2=[8.65 13.72 9.37 14.71 13.84 12.94]; 
figure
BoxPlotCell({E1,E2})
xticklabels({'Cell 1','Cell 2'})
ylabel('Tether Force (pN)')

%%

load('MagneticTweezerSpreadData.mat')
figure
MS=median(short);
ML=median(long);
ESQ=prctile(short,75)-prctile(short,25);
ELQ=prctile(long,75)-prctile(long,25);
ES=sqrt(var(short))/sqrt(length(short));
EL=sqrt(var(long))/sqrt(length(long));
bar([MS ML])
ylabel('Tether Force (pN)')
xticklabels({'40 mins','100 mins'})
% hold on
% errorbar([MS ML],[ESQ ELQ])
