function [Events,NonEvents]=FindDynaminSpikes(MSD,Thresh)


Events=[];
NonEvents=[];
for i=1:length(MSD)
    for i2=1:length(MSD{i}(:,1))
        if MSD{i}(i2,5)>=Thresh
            Events=[Events ; [MSD{i}(i2,1) MSD{i}(i2, 2) MSD{i}(i2,3)]];
        else
            NonEvents=[NonEvents ; [MSD{i}(i2,1) MSD{i}(i2, 2) MSD{i}(i2,3)]];
        end
    end
end