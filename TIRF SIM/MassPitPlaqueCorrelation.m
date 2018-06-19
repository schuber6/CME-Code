clear all

folder{1}='E:\CME Superfolder\CME Data\TIRF SIM\AP2 Pits';
folder{2}='E:\CME Superfolder\CME Data\TIRF SIM\AP2 Plaques';
folder{3}='E:\CME Superfolder\CME Data\TIRF SIM\CALM Pits';
folder{4}='E:\CME Superfolder\CME Data\TIRF SIM\CALM Plaques';
ind=1;
h2=waitbar(0,'Analyzing Pits and Plaques');
for i0=1:length(folder)
    files=FindFiles(folder{i0},'*488.tif');
    for i=1:length(files)
        waitbar(ind/40)
        file560=strcat(files{i}(1:end-7),' 560.tif');
        [FWHMs(ind,:),XCR(ind),shift_x(ind),shift_y(ind)]=CorrelationAnalysis(files{i},file560);
        Group(ind)=i0;
        ind=ind+1;
    end
end
close(h2)

%%

% clear all
% 
% folder{1}='E:\CME Superfolder\CME Data\TIRF SIM\AP2 Pits';
% folder{2}='E:\CME Superfolder\CME Data\TIRF SIM\AP2 Plaques';
% folder{3}='E:\CME Superfolder\CME Data\TIRF SIM\CALM Pits';
% folder{4}='E:\CME Superfolder\CME Data\TIRF SIM\CALM Plaques';
% ind=1;
% h2=waitbar(0,'Analyzing Pits and Plaques');
% for i0=1:length(folder)
%     files=FindFiles(folder{i0},'*488.tif');
%     for i=1:length(files)
%         waitbar(ind/40)
%         file560=strcat(files{i}(1:end-7),' 560.tif');
%         [a(ind,1),b(ind,1)]=size(imread(files{i}));
%         [a(ind,2),b(ind,2)]=size(imread(file560));
%         ind=ind+1;
%     end
% end
% close(h2)

%%

figure
notBoxPlot(XCR,Group)
xticklabels({'AP2 Pits','AP2 Plaques','CALM Pits','CALM Plaques'})
ylabel('Cross Correlation')

%%

figure
notBoxPlot([FWHMs(:,1) ; FWHMs(:,2)],[Group*2-1 Group*2])
ylabel('FWHM of Autocorrelation Peak')
xticklabels({'AP2 Pits 488','AP2 Pits 560','AP2 Plaques 488','AP2 Plaques 560','CALM Pits 488','CALM Pits 560','CALM Plaques 488','CALM Plaques 560'})