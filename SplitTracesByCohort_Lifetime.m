function NSTACoh=SplitTracesByCohort_Lifetime(NSTAgood,NCoh,TCoh,fg)

NSTACoh=cell(1,NCoh);
IntCutoff=0;
for i=1:length(NSTAgood)
    used=find(NSTAgood(i).int>=IntCutoff);
    Coh=0;
        for i2=1:NCoh
            if length(used)*fg<i2*TCoh
                Coh=i2;
                break
            end
        end
        if Coh~=0
        NSTACoh{Coh}=[NSTACoh{Coh} NSTAgood(i)];
        end
end