ind=1;
folder='Z:\Scott\TIRF SIM\Cyclo SIM Movies\CALM';
folders=FindFiles(folder,'*').';
for i=3:length(folders)
    [DM(ind),FWHMg(ind),FWHMr(ind)]=Autocorrelation_Figure_F(folders{i},[1 2]);
    ind=ind+1;
    
end

folder='Z:\Scott\TIRF SIM\Control SIM Movies\CALM';
folders=FindFiles(folder,'*').';
for i=3:length(folders)
    [DM(ind),FWHMg(ind),FWHMr(ind)]=Autocorrelation_Figure_F(folders{i},[1 2]);
    ind=ind+1;
end

%%

figure
subplot(1,2,2)
notBoxPlot(ACr,[1 1 1 1 1 2 2 2 2 2 2]);
xticklabels({'Cyclo','Control'})
ylabel('Clathrin Width / CALM Width')

subplot(1,2,1)
notBoxPlot(DM,[1 1 1 1 1 2 2 2 2 2 2]);
xticklabels({'Cyclo','Control'})
ylabel('Cross-Correlation')

%%

figure
plot(FWHMg,'g')
hold on
plot(FWHMr,'r')