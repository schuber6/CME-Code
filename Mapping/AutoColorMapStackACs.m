clear all
exp_name='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed\Good';
reg='*singlestack*ZGauss.mat';
FilesCell=FindFiles_GroupStacks(exp_name,reg);

for i=1:length(FilesCell)
    ACRatioMaps{i}=TabulateACRatioMap(FilesCell{i},'Reasonable');  
end

GoodControl=2;

for i=1:length(ACRatioMaps)
    FSFig()
    ExpMaps=ACRatioMaps{i};
    Mi=min(min(ExpMaps{1}));
    Ma=max(max(ExpMaps{1}));
    for i2=2:length(ExpMaps)
        m1=min(min(ExpMaps{i2}));
        m2=max(max(ExpMaps{i2}));
        if m1<Mi
            Mi=m1;
        end
        if m2>Ma
            Ma=m2;
        end
    end
    clear AV SD
    for i2=1:5
        subplot(2,3,i2)
        [AV(i2),SD(i2)]=ColorMapSH(ExpMaps{i2},Ma,Mi);
    end
    if i==GoodControl
        CAV=AV;
        CSD=SD;
    end
    subplot(2,3,6)
    plot(AV,'r')
    hold on
    if i>GoodControl
        plot(CAV-(CAV(1)-AV(1)),'g')
        legend('This Cell','Control Cell #1 (Scaled to match stack 1)')
    end
    xlim([.5 5.5])
end