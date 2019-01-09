figure
scatter(MI_rel(:,1),SI_rel(:,1))

MI_dist=abs(MI_rel-1);
figure
scatter(MI_dist(:,1),SI_rel(:,1))

%%

CloseAP2=find(MI_dist(:,1)<=.11);
folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
filessi=FindFiles(folder,'*FXYCMS.mat').';
clear LTs_si FXYCMS_Sel_si LT MM MS
for i=1:length(CloseAP2)
    load(filessi{i})
    [FXYCMS_Sel_si{i},LTs_si{i},MMs_si{i},MSs_si{i}]=SelectSmallOnes(FXYCMS,MinLT);
    LT(i)=median(LTs_si{i});
    MM(i)=median(MMs_si{i});
    MS(i)=median(MSs_si{i});
end
figure
subplot(1,3,1)
scatter(SI_rel(CloseAP2,1),LT*3)
hold on
scatter(1,LT_NS(1)*3,'r')
xlabel('Median CALM Intensity')
ylabel('Median Lifetime (s)')
title('Cells with same AP2 Intensity within 10%')
legend('siRNA','Control')
subplot(1,3,2)
scatter(SI_rel(CloseAP2,1),MM)
hold on
scatter(1,MM_NS(1),'r')
xlabel('Median CALM Intensity')
ylabel('Median AP2 Intensity at Internalization')
subplot(1,3,3)
scatter(SI_rel(CloseAP2,1),MS)
hold on
scatter(1,MS_NS(1),'r')
xlabel('Median CALM Intensity')
ylabel('Median CALM Intensity at Internalization')

%%
figure
scatter(SI_rel(:,1),CALM_Cytosol_BS_rel)

figure
scatter(MI_rel(:,1),AP2_Cytosol_BS_rel)

%%
used=find(AP2_Cytosol_BS_rel>=0);
figure
scatter(CALM_Cytosol_BS_rel(used),PLarge(used))
xlabel('Cytosolic CALM Level')
ylabel('Fraction of Spots that are Stalled')