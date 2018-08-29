clear all
folder='Z:\Scott\TIRF SIM\Osmo SIM\CALM';
% DataFile='Z:\Scott\TIRF SIM\Control SIM Movies\CALM\XCData.mat';
folders=FindFiles(folder,'*min*');
for i=1:length(folders)
    i
    TSTfile=FindFiles(folders{i},'*tracest*');
    if ~isempty(TSTfile)
        DataFile=strcat(TSTfile{1}(1:end-4),'_XCData_180808.mat');
        fileG=FindFiles(folders{i},'*488*cam*');
        fileR=FindFiles(folders{i},'*560*cam*');
        load(TSTfile{1})
        [FWHM,XC,Group,shift_x,shift_y,IntG,IntR]=CorrelationAnalysis_FromTST(tracest,fileR,fileG);
        save(DataFile,'FWHM','XC','Group','shift_x','shift_y','IntG','IntR')
    end
end


%%
clear all
folder='Z:\Scott\TIRF SIM\Osmo SIM\AP2';
%DataFile='Z:\Scott\TIRF SIM\Control SIM Movies\AP2\XCData.mat';
folders=FindFiles(folder,'*min*');
for i=1:length(folders)
    i
    TSTfile=FindFiles(folders{i},'*tracest*');
    if ~isempty(TSTfile)
        DataFile=strcat(TSTfile{1}(1:end-4),'_XCData_180808.mat');
        fileG=FindFiles(folders{i},'*488*cam*');
        fileR=FindFiles(folders{i},'*560*cam*');
        load(TSTfile{1})
        [FWHM,XC,Group,shift_x,shift_y,IntG,IntR]=CorrelationAnalysis_FromTST(tracest,fileR,fileG);
        save(DataFile,'FWHM','XC','Group','shift_x','shift_y','IntG','IntR')
    end
end

% %%
% 
% load('Z:\Scott\TIRF SIM\Control SIM Movies\CALM\0330_W1_144928\TST_XCData.mat')