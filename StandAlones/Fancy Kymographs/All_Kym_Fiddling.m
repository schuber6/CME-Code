%load('E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_012_BS_Red_FXYCMS.mat')
%load('E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Red_FXYCMS.mat')
MinLT=10;

load('E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_012_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes(FXYCMS,MinLT);
[cIM{1},Nr,Ng]=AllTraceKymograph(FXYCMS_Sel,'LT',0);

load('E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies\si_072_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes(FXYCMS,MinLT);
cIM{3}=AllTraceKymograph(FXYCMS_Sel,'LT',0,Nr,Ng);

load('E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes(FXYCMS,MinLT);
cIM{2}=AllTraceKymograph(FXYCMS_Sel,'LT',0,Nr,Ng);

%%
clear cIM
MinLT=10;
load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_002_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
[cIM{1},Nr,Ng]=AllTraceKymograph(FXYCMS_Sel,'AC',0);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Movies\si_cont_026_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
cIM{2}=AllTraceKymograph(FXYCMS_Sel,'AC',0,Nr,Ng);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_028_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
cIM{3}=AllTraceKymograph(FXYCMS_Sel,'AC',0,Nr,Ng);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_030_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
cIM{4}=AllTraceKymograph(FXYCMS_Sel,'AC',0,Nr,Ng);

%%

clear cIM
MinLT=10;
load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_004_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
[cIM{1},Nr,Ng]=AllTraceKymograph(FXYCMS_Sel,'LTCoh',0);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_082_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
cIM{2}=AllTraceKymograph(FXYCMS_Sel,'LTCoh',0,Nr,Ng);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_028_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
cIM{3}=AllTraceKymograph(FXYCMS_Sel,'LTCoh',0,Nr,Ng);

load('E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_064_BS_Red_FXYCMS.mat')
[FXYCMS_Sel]=SelectSmallOnes_AndFullMovie(FXYCMS,MinLT);
cIM{4}=AllTraceKymograph(FXYCMS_Sel,'LTCoh',0,Nr,Ng);

%%

for i=1:4
    [a(i),b,c]=size(cIM{i});
end
for i=1:4
    cIM{i}(max(a),b,c)=0;
end
IM=[cIM{1} cIM{2} cIM{3} cIM{4}];
figure
imshow(IM)


%%

figure
for i=1:4
subplot(1,4,i)
imshow(cIM{i})
end

%%

figure
imshow(cIM{1})

%%
clear IM2
[a,b,c]=size(IM);
IM2(:,:,1)=[IM(:,:,1) zeros(a,b)];
IM2(:,:,2)=[zeros(a,b) IM(:,:,2)];
IM2(:,:,3)=zeros(a,2*b);
figure
imshow(IM2)

%%

imwrite(IM2,'AKTest2.tif')

%%

imwrite(uint8(double(IM)/65535*256),'AKTest5.tif')

%%

figure
d=double(IM(:,:,2));
hist(nonzeros(d(:)),200)