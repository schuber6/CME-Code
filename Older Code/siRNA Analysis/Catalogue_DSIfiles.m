clear all
load('DoubleSIRNA_ManualCytosolData.mat')
CBS_DSI=CBS_DSI([1 3 4 5 6 7 8]);
Area_DSI=Area_DSI([1 3 4 5 6 7 8]);

IncludeStalls=0;

folderwt='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
foldersi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
folderdsi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';
fileswt=FindFiles(folderwt,'*Red_FXYCMS.mat');
filessi=FindFiles(foldersi,'*Red_FXYCMS.mat');
filesdsi=FindFiles(folderdsi,'*Red_FXYCMS.mat');

%Resort cells into more accurate groups
tempsi{1}=filesdsi{5};
tempsi{2}=filesdsi{6};
tempdsi{1}=filessi{5};
filessi{5}=tempsi{1};
filessi{6}=tempsi{2};
filesdsi{5}=tempdsi{1};
inds=[1 2 3 4 5 7];
for i=1:6
    tfilesdsi{i}=filesdsi{inds(i)};
end
filesdsi=tfilesdsi;
ASI=[Area_SI(1:4) Area_DSI(5:6)];
ADSI=[Area_DSI([1 2 3 4 7]) Area_SI(5)];
Area_SI=ASI;
Area_DSI=ADSI;

ind=1;
for i=1:length(fileswt)
    DSI_Struct(ind).file=fileswt{i};
    DSI_Struct(ind).area=Area_WT(i);
    DSI_Struct(ind).SIgroup=0;
    ind=ind+1;
end
for i=1:length(filessi)
    DSI_Struct(ind).file=filessi{i};
    DSI_Struct(ind).area=Area_SI(i);
    DSI_Struct(ind).SIgroup=1;
    ind=ind+1;
end
for i=1:length(filesdsi)
    DSI_Struct(ind).file=filesdsi{i};
    DSI_Struct(ind).area=Area_DSI(i);
    DSI_Struct(ind).SIgroup=2;
    ind=ind+1;
end

save DSI_Struct_180907.mat DSI_Struct

%%

thresh=1000;
Rang=1:151;
load('BothDSIO_DSIOFilesStruct.mat')
for i=1:length(DSI_Struct)
    A=DSI_Struct(i).file;
    load(A)
    [MI,SI]=FindAllMasterSlaveIntensities_InRange(FXYCMS,Rang,thresh);
    DSI_Struct(i).MedianClath=median(MI);
    DSI_Struct(i).MedianCALM=median(SI);
end

save DSI_Struct_180907.mat DSI_Struct

%%
xtl={'Control','\begin{tabular}{c} siRNA \\ High Clathrin \end{tabular}','\begin{tabular}{c} siRNA \\ Low CALM \end{tabular}'};
xtl2={'Control','      siRNA: \newline High Clathrin','    siRNA: \newline Low CALM'};
figure
notBoxPlot([DSI_Struct.MedianCALM],[DSI_Struct.SIgroup])

%set(gca,'xtick', 0:2, 'XTickLabel', xtl, 'TickLabelInterpreter', 'latex');
ylabel('Median CALM Intensity')
YL=ylim;
ylim([0 YL(2)])
xticklabels(xtl2)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

figure
notBoxPlot([DSI_Struct.MedianClath],[DSI_Struct.SIgroup])
xticklabels(xtl2)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)


YL=ylim;
ylim([0 YL(2)])
ylabel('Median Clathrin Intensity')
