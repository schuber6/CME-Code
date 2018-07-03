clear all
folder='Z:\Scott\TIRF SIM\Control SIM Movies\CALM';
% DataFile='Z:\Scott\TIRF SIM\Control SIM Movies\CALM\XCData.mat';
folders=FindFiles(folder,'*W1*');
for i=1:length(folders)
    i
    TSTfile=FindFiles(folders{i},'*TST*');
    if ~isempty(TSTfile)
        DataFile=strcat(TSTfile{1}(1:end-4),'_XCData.mat');
        fileG=FindFiles(folders{i},'*488*cam*');
        fileR=FindFiles(folders{i},'*560*cam*');
        load(TSTfile{1})
        [FWHM,XC,Group,shift_x,shift_y]=CorrelationAnalysis_FromTST(tracest,fileR,fileG);
        save(DataFile,'FWHM','XC','Group','shift_x','shift_y')
    end
end


%%
clear all
folder='Z:\Scott\TIRF SIM\Control SIM Movies\AP2';
%DataFile='Z:\Scott\TIRF SIM\Control SIM Movies\AP2\XCData.mat';
folders=FindFiles(folder,'*W1*');
for i=1:length(folders)
    i
    TSTfile=FindFiles(folders{i},'*TST*');
    if ~isempty(TSTfile)
        DataFile=strcat(TSTfile{1}(1:end-4),'_XCData.mat');
        fileG=FindFiles(folders{i},'*488*cam*');
        fileR=FindFiles(folders{i},'*560*cam*');
        load(TSTfile{1})
        [FWHM,XC,Group,shift_x,shift_y]=CorrelationAnalysis_FromTST(tracest,fileR,fileG);
        save(DataFile,'FWHM','XC','Group','shift_x','shift_y')
    end
end

% %%
% 
% load('Z:\Scott\TIRF SIM\Control SIM Movies\CALM\0330_W1_144928\TST_XCData.mat')