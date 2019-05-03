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