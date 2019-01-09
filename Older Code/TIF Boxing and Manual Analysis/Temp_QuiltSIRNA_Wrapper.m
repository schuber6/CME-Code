folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*Red.tif').';
Scyt=sort(unique(CALM_Cytosol_BS_rel));
order=[];
for i=1:length(Scyt)
    order=[order find(CALM_Cytosol_BS_rel==Scyt(i))];
end
Is=[];
IM={};
ind=1;
for i=1:length(files)
    if isempty(strfind(files{i},'005'))
        Is=[Is i]; 
    end
end
for i=1:length(files)
    if isempty(strfind(files{i},'005'))
        Is=[Is i]; 
        IM{ind}=imread(files{Is(order(ind))},'Index',1);
        ind=ind+1;
    end
end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Red.tif');
for i=1:length(files)

        IM{ind}=imread(files{i},'Index',1);
        ind=ind+1;

end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*003*Red.tif');
for i=1:length(files)

        IM{ind}=imread(files{i},'Index',1);
        ind=ind+1;

end

Quilt=QuiltImages(IM,0);
QFile='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Quilt_Red_Sorted.tif';
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

        IM{ind}=imread(files{Is(order(ind))},'Index',1);
        ind=ind+1;
    end
end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Green.tif');
for i=1:length(files)

        IM{ind}=imread(files{i},'Index',1);
        ind=ind+1;

end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*003*Green.tif');
for i=1:length(files)

        IM{ind}=imread(files{i},'Index',1);
        ind=ind+1;

end

Quilt=QuiltImages(IM,0);
QFile='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Quilt_Green_Sorted.tif';
imwrite(Quilt,QFile);