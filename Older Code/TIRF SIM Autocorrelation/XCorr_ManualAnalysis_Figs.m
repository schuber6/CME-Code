% clear all
% folder='Z:\Scott\TIRF SIM\Control SIM Movies\CALM';
% foldersCALM=FindFiles(folder,'*W1*');
% folder='Z:\Scott\TIRF SIM\Control SIM Movies\AP2';
% foldersAP2=FindFiles(folder,'*W1*');
% FWHMs=[];
% XCRs=[];
% Groups=[];
% for i=1:length(foldersCALM)
%     file=FindFiles(foldersCALM{i},'*Data_180719*');
%     if ~isempty(file)
%         load(file{1})
%         [FWHMs,XCRs,Groups]=UnloadXCData(FWHMs,XCRs,Groups,'CALM',FWHM,XC,Group,'XCMin',IntG,IntR);
%     end
% end
% for i=1:length(foldersAP2)
%     file=FindFiles(foldersAP2{i},'*Data_180719*');
%     if ~isempty(file)
%         load(file{1})
%         [FWHMs,XCRs,Groups]=UnloadXCData(FWHMs,XCRs,Groups,'AP2',FWHM,XC,Group,'XCMin');
%     end
% end

%%

clear all
folder='Z:\Scott\TIRF SIM\Control SIM Movies\CALM';
foldersCALM=FindFiles(folder,'*W1*');
folder='Z:\Scott\TIRF SIM\Control SIM Movies\AP2';
foldersAP2=FindFiles(folder,'*W1*');
FWHMs=[];
XCRs=[];
Groups=[];
Ints=[];
for i=1:length(foldersCALM)
    file=FindFiles(foldersCALM{i},'*Data_180719*');
    if ~isempty(file)
        load(file{1})
        [FWHMs,XCRs,Groups,Ints]=UnloadXCData_WINT(FWHMs,XCRs,Groups,'CALM',FWHM,XC,Group,'XCMin',Ints,IntG,IntR);
    end
end
for i=1:length(foldersAP2)
    file=FindFiles(foldersAP2{i},'*Data_180719*');
    if ~isempty(file)
        load(file{1})
        [FWHMs,XCRs,Groups,Ints]=UnloadXCData_WINT(FWHMs,XCRs,Groups,'AP2',FWHM,XC,Group,'XCMin',Ints,IntG,IntR);
    end
end

%%

clear all
folder='Z:\Scott\TIRF SIM\Osmo SIM\CALM';
foldersCALM=FindFiles(folder,'*min*');
folder='Z:\Scott\TIRF SIM\Osmo SIM\AP2';
foldersAP2=FindFiles(folder,'*min*');
FWHMs=[];
XCRs=[];
Groups=[];
Ints=[];
for i=1:length(foldersCALM)
    file=FindFiles(foldersCALM{i},'*Data_180808*');
    if ~isempty(file)
        load(file{1})
        [FWHMs,XCRs,Groups,Ints]=UnloadXCData_WINT(FWHMs,XCRs,Groups,'CALM',FWHM,XC,Group,'XCMin',Ints,IntG,IntR);
    end
end
for i=1:length(foldersAP2)
    file=FindFiles(foldersAP2{i},'*Data_180808*');
    if ~isempty(file)
        load(file{1})
        [FWHMs,XCRs,Groups,Ints]=UnloadXCData_WINT(FWHMs,XCRs,Groups,'AP2',FWHM,XC,Group,'XCMin',Ints,IntG,IntR);
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
xticklabels({'AP2 Pits 488','AP2 Pits 560','CALM Pits 488','CALM Pits 560','AP2 Plaques 488','AP2 Plaques 560','CALM Plaques 488','CALM Plaques 560'})

%%

figure
notBoxPlot([Ints(:,1) ; Ints(:,2)],[Groups*2-1 Groups*2])
ylabel('Normalized Intensity')
xticklabels({'AP2 Pits 488','AP2 Pits 560','CALM Pits 488','CALM Pits 560','AP2 Plaques 488','AP2 Plaques 560','CALM Plaques 488','CALM Plaques 560'})

%%

figure
notBoxPlot(Ints(:,1)./Ints(:,2),Groups)
ylabel('Adaptor:Clathrin Ratio')
xticklabels({'AP2 Pits','CALM Pits','AP2 Plaques','CALM Plaques'})

%%
clear u1 u2 Y1 Y2 p
u=find(Groups==1);
N=median(FWHMs(u,1));
figure
FM=[FWHMs(:,1)/N ; FWHMs(:,2)/N];
GM=[Groups*2-1 Groups*2-.35];


notBoxPlot(FM,GM)
ylabel('Relative Width of Autocorrelation Peak','FontSize',16)
xticklabels({'AP2','Clathrin','CALM','Clathrin','AP2','Clathrin','CALM','Clathrin'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
xtickangle(30)
hold on
XL=xlim;
line(XL,[1 1],'Color','g','LineStyle','--')
YL=ylim;
line([4.5 4.5],YL,'Color','k')

%Pairs={[1 3],[1.65 3.65],[3 7],[5 7],[5.65 7.65]};
%Pairs={[1 3],[1 5],[1 7],[1.65 3.65],[5.65 7.65]};
Pairs={[1.65 3.65],[5.65 7.65],[1 5],[1 7]};
for i=1:length(Pairs)
    u1{i}=find(GM==Pairs{i}(1));
    Y1{i}=FM(u1{i});
    u2{i}=find(GM==Pairs{i}(2));
    Y2{i}=FM(u2{i});
    [h(i),p(i)] = ttest2(Y1{i},Y2{i});
end
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',26)
%H=sigstar(Pairs,p);

%%
FM2=[];
GM2=[];
ind=1;
Remap={[1 1],[3 4],[5 2],[7 5],[5.65 3],[7.65 6]};
for i=1:length(FM)
    for i2=1:length(Remap)
        if GM(i)==Remap{i2}(1)
            FM2(ind)=FM(i);
            GM2(ind)=Remap{i2}(2);
            ind=ind+1;
        end
    end
end
[TD2,TG2]=TrimGroups(FM2,GM2);
figure
boxplot(TD2,TG2,'positions',[1 2 3 5 6 7],'symbol','')
xticklabels({'AP2 in Pits','AP2 in Plaques','Clathrin in Plaques','CALM in Pits','CALM in Plaques','Clathrin in Plaques'})
xtickangle(30)
ylabel('Relative Width of Autocorrelation Peak')%,'FontSize',14)
ylim([.4 2.1])
YL=ylim;
line([4 4],YL,'Color','k')
title('AP2/Clathrin Cells                     CALM/Clathrin Cells')

%%

FM3=[];
GM3=[];
ind=1;
Remap={[1 1],[1.65 2],[3 3],[3.65 4]};
for i=1:length(FM)
    for i2=1:length(Remap)
        if GM(i)==Remap{i2}(1)
            FM3(ind)=FM(i);
            GM3(ind)=Remap{i2}(2);
            ind=ind+1;
        end
    end
end
[TD3,TG3]=TrimGroups(FM3,GM3);
figure
boxplot(TD3,TG3,'positions',[1 2 3.5 4.5],'symbol','')
xticklabels({'AP2 in Pits','Clathrin in Pits','CALM in Pits','Clathrin in Pits'})
xtickangle(30)
ylabel('Relative Width of Autocorrelation Peak')%,'FontSize',14)
ylim([.4 2.1])
YL=ylim;
line([2.75 2.75],YL,'Color','k')
title('AP2/Clathrin Cells                     CALM/Clathrin Cells')