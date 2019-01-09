folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*.mat').';
load(files{6});

%%

N=5;
for i=1:N^2

    found=0;
    while ~found
        R=ceil(rand*length(FXYCMS));
        if FXYCMS{R}(1,4)==3 && max(FXYCMS{R}(:,1))<=120 && length(FXYCMS{R}(:,1))>=8 && length(FXYCMS{R}(:,1))<=30
            found=1;
        end
    end
    figure(1)
    subplot(N,N,i)
    Red=FXYCMS{R}(:,6);
    Green=FXYCMS{R}(:,7);
    Frames=FXYCMS{R}(:,1);
    plot(Frames,Green,'g')
    hold on
    plot(Frames,Red,'r')
    title(num2str(R))
%     figure(2)
%     subplot(N,N,i)
%     ScatterWithArrows(Red,Green);
%     xlabel('AP2 Intensity')
%     ylabel('CALM Intensity')
end

%%
N=5;
    figure
for i=1:N^2

    found=0;
    while ~found
        R=ceil(rand*length(FXYCMS));
        if FXYCMS{R}(1,4)==3 && max(FXYCMS{R}(:,1))<=120 && length(FXYCMS{R}(:,1))>=8 && length(FXYCMS{R}(:,1))<=30
            found=1;
        end
    end

    subplot(N,N,i)
    Red=FXYCMS{R}(:,6);
    Green=FXYCMS{R}(:,7);
    used=find(Red>0 & Green>0);
    Red=Red(used);
    Green=Green(used);
    Frames=FXYCMS{R}(used,1);
    plot(Frames,Green,'g')
    hold on
    plot(Frames,Red,'r')
    z=CalculateZScoreOfTraceHalfs(log(Green./Red));
    title(num2str(z))
%     figure(2)
%     subplot(N,N,i)
%     ScatterWithArrows(Red,Green);
%     xlabel('AP2 Intensity')
%     ylabel('CALM Intensity')
end

%%

folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*.mat').';

Good{1}=[7691 7183 7186 1276 1115 7068 6629 7932 1210 1225];
Good{2}=[929 720 6736 5097 5991 6860 6614 6057 653 7149 5892];

for i=1:2
    load(files{i});
    figure
    for i2=1:length(Good{i})
        subplot(2,6,i2)
        R=Good{i}(i2);
        Red=FXYCMS{R}(:,6);
        Green=FXYCMS{R}(:,7);
        Frames=FXYCMS{R}(:,1);
        plot(Frames,Green,'g')
        hold on
        plot(Frames,Red/max(Red)*max(Green),'r')
        title(num2str(R))
    end
end
