function [CALMperArea]=TotalCALMIntensityPerArea(files,Areas)

for i=1:length(files)
    load(files{i})
    MF=MaxFrameFXYCMS(FXYCMS);
    CALM{i}=zeros(1,MF);
    for i2=1:length(FXYCMS)
        fxyc=FXYCMS{i2};
        for i3=1:length(fxyc(:,1))
            CALM{i}(fxyc(i3,1))=CALM{i}(fxyc(i3,1))+fxyc(i3,7);
        end
    end
    CALMperArea{i}=CALM{i}/Areas(i);
end
