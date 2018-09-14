function [FXYCMS_C,Val]=ConfirmedConclusions(tracest,FXYCMS)

FXYCMS_C={};
Val=[];
ind=1;
for i=1:length(tracest)
    if tracest(i).ishot
        FXYCMS_C{ind}=FXYCMS{tracest(i).Value};
        Val(ind)=1;
        ind=ind+1;
    end
    if tracest(i).ispair
        FXYCMS_C{ind}=FXYCMS{tracest(i).Value};
        Val(ind)=-1;
        ind=ind+1;
    end
end