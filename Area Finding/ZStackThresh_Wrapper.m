%This code will go through all given folders, find any tifs with "Red" in
%the title, and ask you to manually choose a threshold value to find the
%boundaries of your cells.  It will then calculate average areas around the
%center of your zstack and average cytosolic intensities from the
%corresponding tif with "Green" in the title.  The Areas,
%background-subtracted cytosoic intensities, and cell masks will then be
%saved in the folder.

%Scott Huber 8/15/18

clear all

%Put all ZStack folders here
folder{1}='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\Data\Split Channels\SI_Cont\ZStacks';
folder{2}='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\Data\Split Channels\SI_3m\ZStacks';
folder{3}='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\Data\Split Channels\SI_10m\ZStacks';
folder{4}='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\Data\Split Channels\WT_Cont\ZStacks';
folder{5}='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\Data\Split Channels\WT_3m\ZStacks';
folder{6}='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\Data\Split Channels\WT_10m\ZStacks';

%folder{2}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 3 min 21\ZStacks';

% folder{4}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 10 min 21\ZStacks';
% folder{5}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\ZStacks';
% folder{6}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont 21\ZStacks';
% folder{7}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min\ZStacks';
% folder{8}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min 21\ZStacks';
% folder{9}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min\ZStacks';
% folder{10}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min 21\ZStacks';
% folder{11}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont\ZStacks';
% folder{12}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont 21\ZStacks';


for i=1:length(folder)

    p=strcat('*Areas_prctile.mat');
    file=FindFiles(folder{i},p);
    clear Masks
    if ~isempty(file)
        load(file{1})
    end
    if exist('Masks','var')
        [Red_Cyt_BS{i},Green_Cyt_BS{i},Area{i},masks{i}]=ZStackPrctileFlourescence_Masks(folder{i},Masks);
    else
        [Red_Cyt_BS{i},Green_Cyt_BS{i},Area{i},masks{i}]=ZStackPrctileFlourescence(folder{i});
    end
end


%%

for i=1:length(folder)
    p=strcat(folder{i},'\Areas_RG.mat');
    RedArea=Area{i};
    RedCyt_BS=Red_Cyt_BS{i};
    GreenCyt_BS=Green_Cyt_BS{i};
    Masks=masks{i};
    save(p,'RedArea','RedCyt_BS','GreenCyt_BS','Masks')
end
    