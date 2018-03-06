clear all
[paths,movies]=FindFiles_Full('E:\CME Superfolder\CME Data\180304_CameraTest\UnScaled movies','*.tif');
ind=1;
maxsum='sum';
for i=[1 6] %length(movies)
    Tpath=strcat('E:\CME Superfolder\CME Data\180304_CameraTest\split_movies\',movies{i}(1:end-4),'\Section1\Cell1_3\ch1\Tracking\ProcessedTracks.mat');
    load(Tpath)
    events=[];
    traces=[];
    if strcmp(movies{i}(1:3),'95b')
        size=1200;
        Size=825;
        BackR=4;
        GoodP=80;
        name='95b: ';
        group=1;
        Num=1400*1.2;
        %Pixel=11;
    end
    if strcmp(movies{i}(1:3),'and')
        size=512;
        Size=512;
        BackR=3;
        GoodP=20;
        name='andor: ';
        group=2;
        Num=1400;
        %Pixel=16;
    end
    for i2=1:length(tracks)
        [x,y]=ScalePosition(tracks(i2).x(1),tracks(i2).y(1),Size,size);
        events=[events ; [1 x y]];
        traces=[traces i2];
    end
    [Is,Bs,SDBs]=ManualFitEvents_BackR(events,paths{i},BackR,1,maxsum);
    SIs=sort(Is,'descend');
    Cutoff=SIs(Num);
    %Cutoff=prctile(Is,GoodP);
    used=find(Is>=Cutoff);
    CutoffC(1)=SIs(1);
    xbinsSDx=0:.02:1;
    xbinsSDy=0:.02:1;
    for i2=2:5
        CutoffC(i2)=SIs(Num*i2/4);
        usedC{i2-1}=find(Is>CutoffC(i2) & Is<=CutoffC(i2-1));
        [SDxC{ind}{i2-1},SDyC{ind}{i2-1}]=FindTrackSDs(tracks,traces(usedC{i2-1}));
        [HSDxC{ind}{i2-1},xbinsSDxC{ind}]=hist(SDxC{ind}{i2-1},xbinsSDx);
        [HSDyC{ind}{i2-1},xbinsSDyC{ind}]=hist(SDyC{ind}{i2-1},xbinsSDx);
    end
    [SDx,SDy]=FindTrackSDs(tracks,traces(used));
%     SDx=SDx*Pixel;
%     SDy=SDy*Pixel;
    %figure
%     subplot(1,2,1)
%     hist(Is./SDBs,100)
%     subplot(1,2,2)
    %hist(Is(used)./SDBs(used),25)

    [H{ind},xbins{ind}]=hist(Is(used)./SDBs(used),25);
    [HSD{ind},xbinsSD{ind}]=hist(SDBs(used),25);
    [HSDx{ind},xbinsSDxC{ind}]=hist(SDx,xbinsSDx);
    [HSDy{ind},xbinsSDyC{ind}]=hist(SDy,xbinsSDx);
    SDxCell{ind}=SDx;
    SDyCell{ind}=SDy;
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

L=cell(1,length(H));
% FSFig()
% for i=1:length(H)
%     if Group(i)==1
%         C='g';
%     else
%         C='r';
%     end
%     plot(xbins{i},H{i}/sum(H{i})/(xbins{i}(end)-xbins{i}(1)),C)
%     hold on
%     xlabel(strcat('SNR (',maxsum,' intensity/stdev of background)'))
%     ylabel('Frequency')
%     Med(i)=median(IsCell{i});
%     L{i}=strcat(Name{i},'Median = ',num2str(Med(i)));
% end
% legend(L)
% FSFig()
% for i=1:length(H)
%     if Group(i)==1
%         C='g';
%     else
%         C='r';
%     end
%     plot(xbinsSDxC{i},HSDx{i}/sum(HSDx{i})/(xbinsSDxC{i}(end)-xbinsSDxC{i}(1)),C)
%     hold on
%     xlabel('St. Dev. of trace x-positions')
%     ylabel('Frequency')
%     Med(i)=median(SDxCell{i});
%     L{i}=strcat(Name{i},'Median = ',num2str(Med(i)));
% end
% legend(L)
% FSFig()
% for i=1:length(H)
%     if Group(i)==1
%         C='g';
%     else
%         C='r';
%     end
%     plot(xbinsSDyC{i},HSDy{i}/sum(HSDy{i})/(xbinsSDyC{i}(end)-xbinsSDyC{i}(1)),C)
%     hold on
%     xlabel('St. Dev. of trace y-positions')
%     ylabel('Frequency')
%     Med(i)=median(SDyCell{i});
%     L{i}=strcat(Name{i},'Median = ',num2str(Med(i)));
% end
% legend(L)


FSFig()
ind=1;
for i=1:length(HSDxC)
    for i2=1:length(HSDxC{i})
        subplot(2,2,i2)
        if Group(i)==1
            C='g';
        else
            C='r';
        end
        plot(xbinsSDyC{i},HSDyC{i}{i2}/sum(HSDyC{i}{i2})/(xbinsSDyC{i}(end)-xbinsSDyC{i}(1)),C)
        hold on
        xlabel('St. Dev. of trace y-positions')
        ylabel('Frequency')
        Med(ind)=median(SDyCell{i});
        L{ind}=strcat(Name{i},'Median = ',num2str(Med(ind)));
        ind=ind+1;
        title(num2str(CutoffC(i2)))
    end
end
%legend(L)

FSFig()
ind=1;
for i=1:length(HSDxC)
    for i2=1:length(HSDxC{i})
        subplot(2,2,i2)
        if Group(i)==1
            C='g';
        else
            C='r';
        end
        plot(xbinsSDyC{i},HSDxC{i}{i2}/sum(HSDxC{i}{i2})/(xbinsSDyC{i}(end)-xbinsSDyC{i}(1)),C)
        hold on
        xlabel('St. Dev. of trace x-positions')
        ylabel('Frequency')
        Med(ind)=median(SDxCell{i});
        L{ind}=strcat(Name{i},'Median = ',num2str(Med(ind)));
        ind=ind+1;
        title(num2str(CutoffC(i2)))
    end
end
%legend(L)


% figure
% notBoxPlot(Med,Group)
% xticklabels({'95b','Andor'})
% YL=ylim;
% ylim([0 YL(2)])
% ylabel(strcat('SNR (',maxsum,' intensity/stdev of background)'))

