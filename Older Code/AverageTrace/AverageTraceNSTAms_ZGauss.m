function [Sample,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ,BegAC,FinAC]=AverageTraceNSTAms_ZGauss(NSTAms)

Cut=10;
BegMI=cell(1,Cut);
FinMI=cell(1,Cut);
BegMZ=cell(1,Cut);
FinMZ=cell(1,Cut);
BegSI=cell(1,Cut);
FinSI=cell(1,Cut);
BegSZ=cell(1,Cut);
FinSZ=cell(1,Cut);
BegAC=cell(1,Cut);
FinAC=cell(1,Cut);
usedC=SelectReasonableZGaussFits(NSTAms);
for i=1:length(NSTAms)
    L=length(usedC{i});
    if L>=Cut
        usedB=find(usedC{i},Cut,'first');
        usedF=find(usedC{i},Cut,'last');
        for i2=1:Cut
            BegMI{i2}=[BegMI{i2} NSTAms(i).ZGaussA(usedC{i}(usedB(i2)))];
            BegSI{i2}=[BegSI{i2} NSTAms(i).SZGaussA(usedC{i}(usedB(i2)))];
            BegMZ{i2}=[BegMZ{i2} NSTAms(i).ZGaussX0(usedC{i}(usedB(i2)))];
            BegSZ{i2}=[BegSZ{i2} NSTAms(i).SZGaussX0(usedC{i}(usedB(i2)))];
            BegAC{i2}=[BegAC{i2} log(NSTAms(i).ZGaussA(usedC{i}(usedB(i2)))/NSTAms(i).SZGaussA(usedC{i}(usedB(i2))))];
            
            
            FinMI{i2}=[FinMI{i2} NSTAms(i).ZGaussA(usedC{i}(usedF(i2)))];
            FinSI{i2}=[FinSI{i2} NSTAms(i).SZGaussA(usedC{i}(usedF(i2)))];
            FinMZ{i2}=[FinMZ{i2} NSTAms(i).ZGaussX0(usedC{i}(usedF(i2)))];
            FinSZ{i2}=[FinSZ{i2} NSTAms(i).SZGaussX0(usedC{i}(usedF(i2)))];
            FinAC{i2}=[FinAC{i2} log(NSTAms(i).ZGaussA(usedC{i}(usedF(i2)))/NSTAms(i).SZGaussA(usedC{i}(usedF(i2))))];
        end
    end
end
for i=1:Cut
    MeanBMI(i)=mean(BegMI{i});
    MeanBSI(i)=mean(BegSI{i});
    MeanBMZ(i)=mean(BegMZ{i});
    MeanBSZ(i)=mean(BegSZ{i});
    MeanFMI(i)=mean(FinMI{i});
    MeanFSI(i)=mean(FinSI{i});
    MeanFMZ(i)=mean(FinMZ{i});
    MeanFSZ(i)=mean(FinSZ{i});
    MeanBAC(i)=mean(BegAC{i});
    MeanFAC(i)=mean(FinAC{i});
end
Sample=length(BegMI{1});
FSFig()
subplot(1,2,1)
plot(MeanBMI/max(MeanBMI),'g')
hold on
plot(MeanBSI/max(MeanBSI),'r')
% plot(MeanBMZ/mean(MeanBMZ),'g--')
% hold on
% plot(MeanBSZ/mean(MeanBSZ),'r--')
plot(MeanBMZ,'g--')
hold on
plot(MeanBSZ,'r--')
legend('AP2 Intensity','CLCa Intensity','AP2 Z-Position','CLCa Z-Position')
title(strcat('Beginning of Traces',' N=',num2str(Sample)))
ylim([0 5])
subplot(1,2,2)
plot(MeanFMI/max(MeanFMI),'g')
hold on
plot(MeanFSI/max(MeanFSI),'r')
% plot(MeanBMZ/mean(MeanBMZ),'g--')
% hold on
% plot(MeanBSZ/mean(MeanBSZ),'r--')
plot(MeanFMZ,'g--')
hold on
plot(MeanFSZ,'r--')
legend('AP2 Intensity','CLCa Intensity','AP2 Z-Position','CLCa Z-Position')
legend('AP2 Intensity','CLCa Intensity','AP2 Z-Position','CLCa Z-Position')
title(strcat('End of Traces',' N=',num2str(Sample)))
ylim([0 5])
Sample=length(BegMI{1});
FSFig()
plot(MeanBAC,'g')
hold on
plot(MeanFAC,'r')