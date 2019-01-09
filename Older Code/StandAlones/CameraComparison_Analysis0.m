clear all
[paths,movies]=FindFiles_Full('E:\CME Superfolder\CME Data\180304_CameraTest\UnScaled movies','*.tif');
ind=1;
maxsum='sum';
for i=1:10 %length(movies)
    Tpath=strcat('E:\CME Superfolder\CME Data\180304_CameraTest\split_movies\',movies{i}(1:end-4),'\Section1\Cell1_3\ch1\Tracking\ProcessedTracks.mat');
    load(Tpath)
    events=[];
    if strcmp(movies{i}(1:3),'95b')
        size=1200;
        Size=825;
        BackR=4;
        GoodP=80;
        name='95b: ';
        group=1;
        Num=1400*1.2;
    end
    if strcmp(movies{i}(1:3),'and')
        size=512;
        Size=512;
        BackR=3;
        GoodP=20;
        name='andor: ';
        group=2;
        Num=1400;
    end
    for i2=1:length(tracks)
        [x,y]=ScalePosition(tracks(i2).x(1),tracks(i2).y(1),Size,size);
        events=[events ; [1 x y]];
    end
    [Is,Bs,SDBs]=ManualFitEvents_BackR(events,paths{i},BackR,1,maxsum);
    SIs=sort(Is,'descend');
    Cutoff=SIs(Num);
    %Cutoff=prctile(Is,GoodP);
    used=find(Is>=Cutoff);
    %figure
%     subplot(1,2,1)
%     hist(Is./SDBs,100)
%     subplot(1,2,2)
    %hist(Is(used)./SDBs(used),25)
    [H{ind},xbins{ind}]=hist(Is(used)./SDBs(used),25);
    [HSD{ind},xbinsSD{ind}]=hist(SDBs(used),25);
    IsCell{ind}=Is(used)./SDBs(used);
    SDCell{ind}=SDBs(used);
    Name{ind}=name;
  
    Group(ind)=group;
    ind=ind+1;
    %xlabel('SNR')
    %ylabel('Count')
    %title(strcat(name,num2str(length(used)),' Good Spots. Median SNR = ',num2str(median(Is(used)./SDBs(used)))))
%     figure
%     subplot(1,2,1)
%     hist(Is,100)
%     subplot(1,2,2)
%     hist(Is(used),100)
%     title('Sum Intensity')
    %BoxSpotsByPrctile_Fraction_events(events,Is,paths{i},.1)
end
FSFig()
L=cell(1,length(H));
for i=1:length(H)
    if Group(i)==1
        C='g';
    else
        C='r';
    end
    plot(xbins{i},H{i}/sum(H{i})/(xbins{i}(end)-xbins{i}(1)),C)
    hold on
    xlabel(strcat('SNR (',maxsum,' intensity/stdev of background)'))
    ylabel('Frequency')
    Med(i)=median(IsCell{i});
    L{i}=strcat(Name{i},'Median = ',num2str(Med(i)));
end
FSFig()
L=cell(1,length(H));
for i=1:length(H)
    if Group(i)==1
        C='g';
    else
        C='r';
    end
    plot(xbinsSD{i},HSD{i}/sum(HSD{i})/(xbinsSD{i}(end)-xbinsSD{i}(1)),C)
    hold on
    xlabel(strcat('SNR (',maxsum,' intensity/stdev of background)'))
    ylabel('Frequency')
    Med(i)=median(IsCell{i});
    L{i}=strcat(Name{i},'Median = ',num2str(Med(i)));
end
legend(L)
figure
notBoxPlot(Med,Group)
xticklabels({'95b','Andor'})
YL=ylim;
ylim([0 YL(2)])
ylabel(strcat('SNR (',maxsum,' intensity/stdev of background)'))

