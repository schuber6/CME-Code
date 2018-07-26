clear all
ind=1;
folder='Z:\Scott\TIRF SIM\Osmo SIM\AP2';
folders=FindFiles(folder,'*').';
for i=3:length(folders)
    [DM(ind),FWHMg(ind),FWHMr(ind)]=Autocorrelation_Figure_F(folders{i},[1 2]);
    ind=ind+1;
    
end

folder='Z:\Scott\TIRF SIM\Control SIM Movies\AP2';
folders=FindFiles(folder,'*').';
for i=3:length(folders)
    [DM(ind),FWHMg(ind),FWHMr(ind)]=Autocorrelation_Figure_F(folders{i},[1 2]);
    ind=ind+1;
end

%%
ACr=FWHMr./FWHMg;
figure
subplot(1,2,2)
notBoxPlot(ACr,[1 1 1 1 1 1 1 2 2 2 2 2 2]);
xticklabels({'Osmoshock','Control'})
ylabel('Clathrin Width / AP2 Width')

subplot(1,2,1)
notBoxPlot(DM,[1 1 1 1 1 1 1 2 2 2 2 2 2]);
xticklabels({'Osmoshock','Control'})
ylabel('Cross-Correlation')

%%

figure
notBoxPlot([FWHMg(1:5) FWHMr(1:5) FWHMg(6:11) FWHMr(6:11)],[1 1 1 1 1 1 1 2 2 2 2 2 2 2 3 3 3 3 3 3 4 4 4 4 4 4]);
%%

figure
plot(FWHMg,'g')
hold on
plot(FWHMr,'r')