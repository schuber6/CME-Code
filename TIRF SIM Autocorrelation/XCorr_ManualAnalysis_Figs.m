clear all
folder='Z:\Scott\TIRF SIM\Control SIM Movies\CALM';
foldersCALM=FindFiles(folder,'*W1*');
folder='Z:\Scott\TIRF SIM\Control SIM Movies\AP2';
foldersAP2=FindFiles(folder,'*W1*');
FWHMs=[];
XCRs=[];
Groups=[];
for i=1:length(foldersCALM)
    file=FindFiles(foldersCALM{i},'*Data*');
    if ~isempty(file)
        load(file{1})
        [FWHMs,XCRs,Groups]=UnloadXCData(FWHMs,XCRs,Groups,'CALM',FWHM,XC,Group,'XCMin');
    end
end
for i=1:length(foldersAP2)
    file=FindFiles(foldersAP2{i},'*Data*');
    if ~isempty(file)
        load(file{1})
        [FWHMs,XCRs,Groups]=UnloadXCData(FWHMs,XCRs,Groups,'AP2',FWHM,XC,Group,'XCMin');
    end
end

%%
figure
notBoxPlot(XCRs,Groups)
xticklabels({'AP2 Pits','AP2 Plaques','CALM Pits','CALM Plaques'})
ylabel('Cross Correlation')

%%

figure
notBoxPlot([FWHMs(:,1) ; FWHMs(:,2)],[Groups*2-1 Groups*2])
ylabel('FWHM of Autocorrelation Peak')
xticklabels({'AP2 Pits 488','AP2 Pits 560','AP2 Plaques 488','AP2 Plaques 560','CALM Pits 488','CALM Pits 560','CALM Plaques 488','CALM Plaques 560'})