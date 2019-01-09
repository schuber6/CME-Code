clear all
%exp_name='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed\Good';
exp_name='E:\CME Superfolder\CME Data\180208_AP2CLCa_Data\Traces\Good';
reg='*singlestack*ZGauss.mat';
FilesCell=FindFiles_GroupStacks(exp_name,reg);

for i=1:length(FilesCell)
    [ARatioMaps{i},CRatioMaps{i},ACRatioMaps{i}]=TabulateAandCRatioMap(FilesCell{i},'Reasonable') ;   
end

GoodControl=2;

for i=1:length(ACRatioMaps)
    FSFig()
    ExpMapsAC=ACRatioMaps{i};
    ExpMapsA=ARatioMaps{i};
    ExpMapsC=CRatioMaps{i};
    MiAC=min(min(ExpMapsAC{1}));
    MaAC=max(max(ExpMapsAC{1}));
    MiA=min(min(ExpMapsA{1}));
    MaA=max(max(ExpMapsA{1}));
    MiC=min(min(ExpMapsC{1}));
    MaC=max(max(ExpMapsC{1}));
    for i2=2:length(ExpMapsAC)
        m1AC=min(min(ExpMapsAC{i2}));
        m2AC=max(max(ExpMapsAC{i2}));
        if m1AC<MiAC
            MiAC=m1AC;
        end
        if m2AC>MaAC
            MaAC=m2AC;
        end
        m1A=min(min(ExpMapsA{i2}));
        m2A=max(max(ExpMapsA{i2}));
        if m1A<MiA
            MiA=m1A;
        end
        if m2A>MaA
            MaA=m2A;
        end
        m1C=min(min(ExpMapsC{i2}));
        m2C=max(max(ExpMapsC{i2}));
        if m1C<MiC
            MiC=m1C;
        end
        if m2C>MaC
            MaC=m2C;
        end
    end
    clear AV SD
    for i2=1:5
        subplot(3,6,i2)
        [AVAC(i2),SDAC(i2)]=ColorMapSH(ExpMapsAC{i2},MaAC,MiAC);
        subplot(3,6,i2+6)
        [AVA(i2),SDA(i2)]=ColorMapSH(ExpMapsA{i2},MaA,MiA);
        subplot(3,6,i2+12)
        [AVC(i2),SDC(i2)]=ColorMapSH(ExpMapsC{i2},MaC,MiC);
    end
    if i==GoodControl
        CAVAC=AVAC;
        CSDAC=SDAC;
        CAVA=AVA;
        CSDA=SDA;
        CAVC=AVC;
        CSDC=SDC;
    end
    subplot(3,6,6)
    plot(AVAC,'r')
    hold on
    if i>GoodControl
        plot(CAVAC-(CAVAC(1)-AVAC(1)),'g')
        legend('This Cell','Control Cell #1 (Scaled to match stack 1)')
    end
    xlim([.5 5.5])
    subplot(3,6,12)
    plot(AVA,'r')
    hold on
    if i>GoodControl
        plot(CAVA-(CAVA(1)-AVA(1)),'g')
        legend('This Cell','Control Cell #1 (Scaled to match stack 1)')
    end
    xlim([.5 5.5])
    subplot(3,6,18)
    plot(AVC,'r')
    hold on
    if i>GoodControl
        plot(CAVC-(CAVC(1)-AVC(1)),'g')
        legend('This Cell','Control Cell #1 (Scaled to match stack 1)')
    end
    xlim([.5 5.5])
end