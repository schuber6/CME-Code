folder='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels';
filesAP2_SIRNA=FindFiles(folder,'ap2_sirna*2dt*Red_FXYCMS*').';
PreRange=1:100;
L{1}=cell(1,5);
L{2}=cell(1,5);
ind=1;
figure
for i=1:length(filesAP2_SIRNA)
    if isempty(strfind(filesAP2_SIRNA{i},'postosmo'))
        load(filesAP2_SIRNA{i})
        [MI,SI]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PreRange);
        subplot(1,2,1)
        [H,xbins]=hist(MI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'r')
        hold on
        xlabel('AP2 Intensity')
        L{1}{ind}=strcat('Mean=',num2str(mean(MI)));
        subplot(1,2,2)
        [H,xbins]=hist(SI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'r')
        hold on
        xlabel('CALM Intensity')
        L{2}{ind}=strcat('Mean=',num2str(mean(SI)));
        ind=ind+1;
    end
end

folder='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels';
filesAP2_SIRNA=FindFiles(folder,'ap2_nosirna*2dt*Red_FXYCMS*').';
PreRange=1:100;
for i=1:length(filesAP2_SIRNA)
    if isempty(strfind(filesAP2_SIRNA{i},'postosmo'))
        load(filesAP2_SIRNA{i})
        [MI,SI]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PreRange);
        subplot(1,2,1)
        [H,xbins]=hist(MI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'g')
        hold on
        xlabel('AP2 Intensity')
        L{1}{ind}=strcat('Mean=',num2str(mean(MI)));
        subplot(1,2,2)
        [H,xbins]=hist(SI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'g')
        hold on
        xlabel('CALM Intensity')
        L{2}{ind}=strcat('Mean=',num2str(mean(SI)));
        ind=ind+1;
    end
end

subplot(1,2,1)
legend(L{1})
xlim([0 15000])
title('Comparison of All Detected Intensities of Cells With or Without siRNA before Osmotic Shock')
subplot(1,2,2)
legend(L{2})
xlim([0 20000])

%%

folder='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels';
filesAP2_SIRNA=FindFiles(folder,'ap2_sirna*2dt*Red_FXYCMS*').';
PreRange=1:100;
L{1}=cell(1,5);
L{2}=cell(1,5);
ind=1;
figure
for i=1:length(filesAP2_SIRNA)
    if isempty(strfind(filesAP2_SIRNA{i},'postosmo'))
        load(filesAP2_SIRNA{i})
        [MI,SI]=FindAllConclusionMaxIntensities_InRange(FXYCMS,PreRange);
        subplot(1,2,1)
        [H,xbins]=hist(MI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'r')
        hold on
        xlabel('AP2 Intensity')
        L{1}{ind}=strcat('Mean=',num2str(mean(MI)));
        subplot(1,2,2)
        [H,xbins]=hist(SI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'r')
        hold on
        xlabel('CALM Intensity')
        L{2}{ind}=strcat('Mean=',num2str(mean(SI)));
        ind=ind+1;
    end
end

folder='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels';
filesAP2_SIRNA=FindFiles(folder,'ap2_nosirna*2dt*Red_FXYCMS*').';
PreRange=1:100;
for i=1:length(filesAP2_SIRNA)
    if isempty(strfind(filesAP2_SIRNA{i},'postosmo'))
        load(filesAP2_SIRNA{i})
        [MI,SI]=FindAllConclusionMaxIntensities_InRange(FXYCMS,PreRange);
        subplot(1,2,1)
        [H,xbins]=hist(MI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'g')
        hold on
        xlabel('AP2 Intensity')
        L{1}{ind}=strcat('Mean=',num2str(mean(MI)));
        subplot(1,2,2)
        [H,xbins]=hist(SI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'g')
        hold on
        xlabel('CALM Intensity')
        L{2}{ind}=strcat('Mean=',num2str(mean(SI)));
        ind=ind+1;
    end
end

subplot(1,2,1)
legend(L{1})
xlim([0 15000])
title('Comparison of All Conclusion Intensities of Cells With or Without siRNA before Osmotic Shock')
subplot(1,2,2)
legend(L{2})
xlim([0 25000])

%%

folder='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels';
filesAP2_SIRNA=FindFiles(folder,'ap2_sirna*85p_2dt*Red_FXYCMS*').';
PreRange=1:100;
PostRange=122:222;
L{1}=cell(1,3);
L{2}=cell(1,3);
ind=1;
figure
for i=[1 3]
    if isempty(strfind(filesAP2_SIRNA{i},'postosmo'))
        load(filesAP2_SIRNA{i})
        [MI,SI]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PostRange);
        subplot(1,2,1)
        [H,xbins]=hist(MI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'r')
        hold on
        xlabel('AP2 Intensity')
        L{1}{ind}=strcat('Mean=',num2str(mean(MI)));
        subplot(1,2,2)
        [H,xbins]=hist(SI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'r')
        hold on
        xlabel('CALM Intensity')
        L{2}{ind}=strcat('Mean=',num2str(mean(SI)));
        ind=ind+1;
    else
                load(filesAP2_SIRNA{i})
        [MI,SI]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PreRange);
        subplot(1,2,1)
        [H,xbins]=hist(MI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'r')
        hold on
        xlabel('AP2 Intensity')
        L{1}{ind}=strcat('Mean=',num2str(mean(MI)));
        subplot(1,2,2)
        [H,xbins]=hist(SI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'r')
        hold on
        xlabel('CALM Intensity')
        L{2}{ind}=strcat('Mean=',num2str(mean(SI)));
        ind=ind+1;
    end
end

folder='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels';
filesAP2_SIRNA=FindFiles(folder,'ap2_nosirna*85p_2dt*Red_FXYCMS*').';
PreRange=1:100;
for i=1:length(filesAP2_SIRNA)
    if isempty(strfind(filesAP2_SIRNA{i},'postosmo'))
        load(filesAP2_SIRNA{i})
        [MI,SI]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PostRange);
        subplot(1,2,1)
        [H,xbins]=hist(MI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'g')
        hold on
        xlabel('AP2 Intensity')
        L{1}{ind}=strcat('Mean=',num2str(mean(MI)));
        subplot(1,2,2)
        [H,xbins]=hist(SI);
        plot(xbins,H/sum(H)/(max(xbins)-min(xbins)),'g')
        hold on
        xlabel('CALM Intensity')
        L{2}{ind}=strcat('Mean=',num2str(mean(SI)));
        ind=ind+1;
    end
end

subplot(1,2,1)
legend(L{1})
xlim([0 15000])
title('Comparison of All Detected Intensities of Cells With or Without siRNA after Osmotic Shock')
subplot(1,2,2)
legend(L{2})
xlim([0 20000])

%%

