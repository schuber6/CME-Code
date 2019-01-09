function FXYCMS_Sel=ThresholdMaster(FXYCMS,Thresh)

FXYCMS_Sel={};
ind=1;
for i=1:length(FXYCMS)
    if max(FXYCMS{i}(:,6)>Thresh)
        FXYCMS_Sel{ind}=FXYCMS{i};
        ind=ind+1;
    end
end