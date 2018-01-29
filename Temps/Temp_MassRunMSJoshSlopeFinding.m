clear
folder='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
prereg='*pre*fxycMS.mat';
filespre=FindFiles(folder,prereg);
for i=1:length(filespre)
    load(filespre{i})
    [JFm_ac{i},JRm_ac{i},JFs_ac{i},JRs_ac{i}]=CountJoshSlopes_MS(fxycMS);
end

folder='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
postreg='*post*fxycMS.mat';
filespost=FindFiles(folder,postreg);
for i=1:length(filespost)
    load(filespost{i})
    [JFm_ao{i},JRm_ao{i},JFs_ao{i},JRs_ao{i}]=CountJoshSlopes_MS(fxycMS);
end

folder='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
prereg='*pre*fxycMS.mat';
filespre=FindFiles(folder,prereg);
for i=1:length(filespre)
    load(filespre{i})
    [JFm_cc{i},JRm_cc{i},JFs_cc{i},JRs_cc{i}]=CountJoshSlopes_MS(fxycMS);
end

folder='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
postreg='*osmo*fxycMS.mat';
filespost=FindFiles(folder,postreg);
for i=1:length(filespost)
    load(filespost{i})
    [JFm_co{i},JRm_co{i},JFs_co{i},JRs_co{i}]=CountJoshSlopes_MS(fxycMS);
end

save 180105_MSJoshSlopes_Mass.mat