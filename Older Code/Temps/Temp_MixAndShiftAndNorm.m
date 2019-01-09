clear all
% % movieR='E:\CME Superfolder\CME Data\170518_Analysis\170518_postosmo_004RFP_BS.tif';
% % movieG='E:\CME Superfolder\CME Data\170518_Analysis\170518_postosmo_004GFP_BS.tif';
% movieR='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies\170519_post_003RFP_BS.tif';
% movieG='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies\170519_post_003GFP_BS.tif';

movieR='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo\005_osmo_RFP_BS.tif';
movieG='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo\005_osmo_GFP_BS.tif';


%movieR='E:\CME Superfolder\CME Data\170905_CALM_CLCa\010_RFP_BS.tif';
FR=length(imfinfo(movieR));
%movieG='E:\CME Superfolder\CME Data\170905_CALM_CLCa\010_GFP_BS.tif';
FG=length(imfinfo(movieG));
%newmovie='E:\CME Superfolder\CME Data\170905_CALM_CLCa\010_MixN_BS.tif';
newmovie='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo\005_osmo_MixN_Shift.tif';
% newmovie='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies\170519_post_003_MixNormShift.tif';
shift=5;
for i=1:min(FR,FG)
    A=imread(movieR,'Index',i);
    VA=reshape(A,[1 512*512]);
    mA=mean(VA);
    B=imread(movieG,'Index',i);
    VB=reshape(B,[1 512*512]);
    mB=mean(VB);
    AN=double(A)/mA*1000;
    BN=double(B)/mB*1000;
    [X,Y]=size(AN);
    SA=zeros(X,shift);
    AN=[SA AN];
    BN=[BN SA];
    C(:,:,1)=uint16(AN);
    C(:,:,3)=uint16(BN);
    imwrite(C,newmovie,'Writemode','append','Compression','none')
end