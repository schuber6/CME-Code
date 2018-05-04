clear N
folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
for i0=1:length(files)
    file=strcat(files{i0}(1:end-11),'.tif');
    [masks_Cell, RedCell_Thresh(i0)] = spread_cell_thresholding_FirstFrame(file);
    masks_Cell_bool=masks_Cell>0;
    Area(i0)=sum(sum(masks_Cell_bool(:,:,1)))*.16^2;
end

%%


folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Red_FXYCMS*');
for i0=1:length(files)
    file=strcat(files{i0}(1:end-11),'.tif');
    [masks_Cell, RedCell_Thresh_WT_009] = spread_cell_thresholding_FirstFrame(file);
    masks_Cell_bool=masks_Cell>0;
    Area_WT_009=sum(sum(masks_Cell_bool(:,:,1)))*.16^2;
end

%%

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*003*Red_FXYCMS*');
for i0=1:length(files)
    file=strcat(files{i0}(1:end-11),'.tif');
    [masks_Cell, RedCell_Thresh_WT_003] = spread_cell_thresholding_FirstFrame(file);
    masks_Cell_bool=masks_Cell>0;
    Area_WT_003=sum(sum(masks_Cell_bool(:,:,1)))*.16^2;
end

%%

folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels\FirstFrameCovered';
files=FindFiles(folder,'*.tif').';
for i0=1:2 %length(files)
    [masks_Cell, RedCell_Thresh(i0)] = spread_cell_thresholding_FirstFrame(files{i0});
    masks_Cell_bool=masks_Cell>0;
    Area(i0)=sum(sum(masks_Cell_bool(:,:,1)))*.16^2;
end