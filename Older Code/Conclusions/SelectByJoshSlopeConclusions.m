function [FXYCMS_Sel,Value,Slopes]=SelectByJoshSlopeConclusions(FXYCMS)

Cutoff=-.06;
FXYCMS_Sel={};
ind=1;
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if length(fxyc(1,:))==9
        if min(fxyc(:,8))<=Cutoff
            FXYCMS_Sel{ind}=fxyc;
            Value(ind)=min(fxyc(:,8));
            Slopes{ind}=fxyc(:,8);
            ind=ind+1;
        end
    end
end
        