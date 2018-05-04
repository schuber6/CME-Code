figure
scatter(AP2_Cytosol_BS_rel(2:end),MM_rel(2:end,1),[],CALM_Cytosol_BS_rel(2:end))
xlabel('Cytosolic AP2 (Relative to WT)')
ylabel('Median AP2 Intensity (Relative to WT)')
h = colorbar;
ylabel(h,'Cytosolic CALM (Relative to WT)')