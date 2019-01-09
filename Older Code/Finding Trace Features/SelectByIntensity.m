function [FXYCMS_Sel]=SelectByIntensity(FXYCMS)

Cutoff=3000;
MinLTF=10;
FXYCMS_Sel={};
ind=1;
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    %if length(fxyc(1,:))==9
        if max(fxyc(:,6))>=Cutoff && length(fxyc(:,1))>=MinLTF
            FXYCMS_Sel{ind}=fxyc;

            ind=ind+1;
        end
    %end
end
        