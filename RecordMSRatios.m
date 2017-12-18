function [MI,SI,R,MS,SS]=RecordMSRatios(fxyc_struct,Good)

for i=1:length(Good(:,1))
    
    MI(i)=mean([fxyc_struct(Good(i,1)).Mint(Good(i,2)) fxyc_struct(Good(i,1)).Mint5(Good(i,2))]);
    SI(i)=mean([fxyc_struct(Good(i,1)).Sint(Good(i,2)) fxyc_struct(Good(i,1)).Sint5(Good(i,2))]);
    MS(i)=fxyc_struct(Good(i,1)).MSum5(Good(i,2));
    SS(i)=fxyc_struct(Good(i,1)).SSum5(Good(i,2));
end
R=MI./SI;