folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*Red.tif').';
Scyt=sort(unique(CALM_Cytosol_BS_rel));
order=[];
for i=1:length(Scyt)
    order=[order find(CALM_Cytosol_BS_rel==Scyt(i))];
end

IM={};
ind=1;
for i=1:length(files)
    if isempty(strfind(files{i},'005'))
        fileMat=strcat(files{i}(1:end-4),'_FXYCMS.mat');
        Is=[Is i]; 
        IM{ind}=imread(files{Is(order(ind))},'Index',1);
        IM_crop{ind}=MakePitCrop(files{i},fileMat);
        ind=ind+1;
    end
end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Red.tif');
for i=1:length(files)
fileMat=strcat(files{i}(1:end-4),'_FXYCMS.mat');
        IM{ind}=imread(files{i},'Index',1);
        IM_crop{ind}=MakePitCrop(files{i},fileMat);
        ind=ind+1;

end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*003*Red.tif');
for i=1:length(files)
fileMat=strcat(files{i}(1:end-4),'_FXYCMS.mat');
        IM{ind}=imread(files{i},'Index',1);
        IM_crop{ind}=MakePitCrop(files{i},fileMat);
        ind=ind+1;

end

% Quilt=QuiltImages(IM);
% QFile='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Quilt_Red.tif';
% imwrite(Quilt,QFile);

Quilt=QuiltImages(IM_crop,1);
QFile='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Quilt_Red_Crops_Sorted.tif';
imwrite(Quilt,QFile);

%%

folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*Green.tif').';
Scyt=sort(unique(CALM_Cytosol_BS_rel));
order=[];
for i=1:length(Scyt)
    order=[order find(CALM_Cytosol_BS_rel==Scyt(i))];
end

IM={};
ind=1;
for i=1:length(files)
    if isempty(strfind(files{i},'005'))
        fileMat=strcat(files{i}(1:end-9),'Red_FXYCMS.mat');
        Is=[Is i]; 
        IM{ind}=imread(files{Is(order(ind))},'Index',1);
        IM_crop{ind}=MakePitCrop(files{i},fileMat);
        ind=ind+1;
    end
end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Green.tif');
for i=1:length(files)

        fileMat=strcat(files{i}(1:end-9),'Red_FXYCMS.mat');
        Is=[Is i]; 
        IM{ind}=imread(files{i},'Index',1);
        IM_crop{ind}=MakePitCrop(files{i},fileMat);
        ind=ind+1;

end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*003*Green.tif');
for i=1:length(files)

        fileMat=strcat(files{i}(1:end-9),'Red_FXYCMS.mat');
        Is=[Is i]; 
        IM{ind}=imread(files{i},'Index',1);
        IM_crop{ind}=MakePitCrop(files{i},fileMat);
        ind=ind+1;

end

% Quilt=QuiltImages(IM);
% QFile='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Quilt_Red.tif';
% imwrite(Quilt,QFile);

Quilt=QuiltImages(IM_crop,1);
QFile='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Quilt_Green_Crops_Sorted.tif';
imwrite(Quilt,QFile);