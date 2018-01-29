function [Sample,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ]=AverageTraceNSTAms(NSTAms)

Cut=10;
BegMI=cell(1,Cut);
FinMI=cell(1,Cut);
BegMZ=cell(1,Cut);
FinMZ=cell(1,Cut);
BegSI=cell(1,Cut);
FinSI=cell(1,Cut);
BegSZ=cell(1,Cut);
FinSZ=cell(1,Cut);
for i=1:length(NSTAms)
    L=length(find(NSTAms(i).sclass==0));
    if L>=Cut
        usedB=find(NSTAms(i).sclass==0,Cut,'first');
        usedF=find(NSTAms(i).sclass==0,Cut,'last');
        for i2=1:Cut
            BegMI{i2}=[BegMI{i2} NSTAms(i).mint(usedB(i2))];
            BegSI{i2}=[BegSI{i2} NSTAms(i).sint(usedB(i2))];
            BegMZ{i2}=[BegMZ{i2} NSTAms(i).st(usedB(i2))];
            BegSZ{i2}=[BegSZ{i2} NSTAms(i).sst(usedB(i2))];
            FinMI{i2}=[FinMI{i2} NSTAms(i).mint(usedF(i2))];
            FinSI{i2}=[FinSI{i2} NSTAms(i).sint(usedF(i2))];
            FinMZ{i2}=[FinMZ{i2} NSTAms(i).st(usedF(i2))];
            FinSZ{i2}=[FinSZ{i2} NSTAms(i).sst(usedF(i2))];
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
end
Sample=length(BegMI{1});
FSFig()
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
FSFig()
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
Sample=length(BegMI{1});