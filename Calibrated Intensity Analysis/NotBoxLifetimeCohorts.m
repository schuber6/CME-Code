y=MMI;
x=floor(LTs/30);
used=find(x);
figure
notBoxPlot(y(used),x(used));
xlim([0 4.5])
ylabel('Maximum Number of GFPs')
xlabel('Lifetime Cohort')
xticks([1 2 3 4])
xticklabels({'30-60s','60-90s','90-120s','120-150s'})