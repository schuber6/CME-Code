clear cIM
MinLT=10;
load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_016_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
[cIM{1}{1},Nr,Ng]=AllTraceKymograph(FXYCMS_Sel,'LTCoh',1);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_022_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
cIM{1}{2}=AllTraceKymograph(FXYCMS_Sel,'LTCoh',1,Nr,Ng);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_028_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
[cIM{2}{1},Nr,Ng]=AllTraceKymograph(FXYCMS_Sel,'LTCoh',1);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_046_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
cIM{2}{2}=AllTraceKymograph(FXYCMS_Sel,'LTCoh',1,Nr,Ng);

%%

for i0=1:2
figure
for i=1:2
subplot(1,2,i)
imshow(cIM{i0}{i})
end
end