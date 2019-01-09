function [ManI,SCell,Inds]=Make_SCellF(FXYCMS)
    
ManI={};
Inds=[];
ind=1;
ManI3={};
ind3=1;
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if length(fxyc(:,1))>=10 && length(fxyc(:,1))<=50
        if fxyc(1,4)==3
            ManI3{ind3}=fxyc(:,6).';
            ind3=ind3+1;
        end
        if fxyc(1,4)<=3
            ManI{ind}=fxyc(:,6).';
            Inds=[Inds i];
            ind=ind+1;
        end
    end
end
Cohort_AverageTraces_NoPlot;