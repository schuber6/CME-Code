FSFig
for i=1:length(order)
    load(filessi{order(i)})
FXYCMS_Sel=SelectSmallOnes(FXYCMS);
[inds,Ms,Mm]=FindDimmestSlaves(FXYCMS_Sel,100);
subplot(5,5,i)
scatter(Mm,Ms)
xlabel('AP2 Intensity at CALM maximum')
ylabel('CALM Intensity at CALM maximum')
end

%%

for i=1:length(order)
    PLarge_Sorted(i)=PLarge(order(i));
end

figure
plot(PLarge_Sorted)

%%
figure
scatter(CALM_Cytosol_BS_rel,PLarge)
xlabel('Cytosolic CALM (Relative to WT)')
ylabel('Percentage of Stalled Spots')

%%

LT_Med_Small=StatCell(LTs_si,'median');
figure
scatter(CALM_Cytosol_BS_rel,LT_Med_Small/median(LTs_nsi))
xlabel('Cytosolic CALM (Relative to WT)')
ylabel('Median Lifetime of Completing Spots (Relative to WT)')

%%

MM_Med_Small=StatCell(MMs_si,'median');
figure
scatter(AP2_Cytosol_BS_rel,MM_Med_Small/median([MMs_nsi MMs_nsi2]))
xlabel('Cytosolic AP2 (Relative to WT)')
ylabel('Median AP2 of Internalizing Pits (Relative to WT)')