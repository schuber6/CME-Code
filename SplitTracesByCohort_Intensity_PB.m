function NSTACoh=SplitTracesByCohort_Intensity_PB(NSTAgood,NCoh,ICoh)

NSTACoh=cell(1,NCoh);
IntCutoff=0;
for i=1:length(NSTAgood)
    used=find(NSTAgood(i).int_PB>=IntCutoff);
    Coh=0;
        for i2=1:NCoh
            if median(NSTAgood(i).int)<i2*ICoh
                Coh=i2;
                break
            end
        end
        if Coh~=0
        NSTACoh{Coh}=[NSTACoh{Coh} NSTAgood(i)];
        end
end