ThreshM=400;
ThreshS=400;
MinR=.5;
for i=1:9
    used=find(XYAmAs{i}(:,3)>ThreshM & (XYAmAs{i}(:,4)>ThreshS) & XYAmAs{i}(:,3)./XYAmAs{i}(:,4)>MinR); 
    Ratio_MS{i}=XYAmAs{i}(used,3)./XYAmAs{i}(used,4);
    Meds(i)=median(Ratio_MS{i});
    Meds2(i)=median(XYAmAs{i}(used,3))/median(XYAmAs{i}(used,4));
end
Time=[-2.5 -.5 2 4 6 8 10 12 14];
plot(Time,Meds)
hold on
YL=ylim;
line([0 0],YL,'Color','r')
ylim(YL)
xlabel('Time (minutes)(Osmoshock happens at 0)')
ylabel('AP2/CLTA Signal Ratio')
