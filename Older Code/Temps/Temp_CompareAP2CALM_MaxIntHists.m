
folderAP2='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';
regAP2='*AP2*.mat';
ListAP2=FindFiles(folderAP2,regAP2);
%figure
for i=1:length(ListAP2)
    load(ListAP2{i})
    %subplot(3,3,i)
    maxs=HistMaxInts(Threshfxyc,0);
    for i2=1:99
        pct=i2;
        topA(i,i2)=prctile(maxs,pct);
%     if i==2
%         title('AP2 Cells')
%     end
    end
end
for i2=1:99
    MA(i2)=mean(topA(:,i2));
end
folderCALM='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies';
regCALM='*sum*Stack2.mat';
ListCALM=FindFiles(folderCALM,regCALM);
%figure
%title('CALM Max Ints')
for i=1:length(ListCALM)
    load(ListCALM{i})
    %subplot(3,3,i)
    maxs=HistMaxInts(Threshfxyc,0);
    for i2=1:99
        pct=i2;
        topC(i,i2)=prctile(maxs,pct);
%     if i==2
%         title('AP2 Cells')
%     end
    end
end
for i2=1:99
    MC(i2)=mean(topC(:,i2));
    topA(:,i2)=topA(:,i2)/MC(i2);
    topC(:,i2)=topC(:,i2)/MC(i2);
end
figure
boxplot(topC)
hold on
boxplot(topA,'PlotStyle','compact')
ylim([0 4])
xlabel('Percentile')
ylabel('Maximum Trace Intensity')
title('Comparison of CALM and AP2 max intensities by percentile')
