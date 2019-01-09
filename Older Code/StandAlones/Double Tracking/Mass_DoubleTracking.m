clear all
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
filesG=FindFiles(folder,'*Green_FXYCMS*');
filesR=FindFiles(folder,'*Red_FXYCMS*');
load('WT_Matches.mat')
for i=1:length(filesG)
    load(filesG{i})
    FXYCMSg=FXYCMS;
    load(filesR{i})
    FXYCMSr=FXYCMS;
    if i~=1
    Matches{i}=MatchFXYCMSs(FXYCMSg,FXYCMSr);
    end
    [p{i},FPp{i}]=QuantifyDoubleTrackingAccuracy(FXYCMSg,FXYCMSr,Matches{i});
end
save('WT_Matches.mat','Matches')

%%

folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
filesG=FindFiles(folder,'*Green_FXYCMS*');
filesR=FindFiles(folder,'*Red_FXYCMS*');
for i=1:length(filesR)
    load(filesR{i})
    MedR(i)=FindMedianMaxMasterIntensity(FXYCMS);
    load(filesG{i})
    MedG(i)=FindMedianMaxMasterIntensity(FXYCMS);
end