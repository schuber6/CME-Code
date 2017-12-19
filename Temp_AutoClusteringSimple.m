clear all
exp_name='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies';
%exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';

tmpd = dir(fullfile(exp_name,'*.mat'));
LastN=10;
thresh=500;
MinNum=5;
for i0=2:5 %1:length(tmpd)
    
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    files{i0}=strcat(movies{i0}(1:end-4),'.tif');
    newfiles{i0}=strcat(movies{i0}(1:end-4),'_Boxed','.tif');
    load(movies{i0});
    if i0==2 || i0==5
        x=(10:MaxFrameFXYC(Threshfxyc)).';
        exposure=4;
        thresh=1000;
    else
        x=(5:MaxFrameFXYC(Threshfxyc)).';
        exposure=8;
        thresh=2000;
    end
    INTcell=MakeIntCellFromFXYC_LastN(Threshfxyc,thresh,MinNum,LastN);
    minnum=8;
    NT=length(INTcell);
    %     [clusters] = createTraceLibrary_Temp(INTcell,3,floor(NT/minnum),8,0,1);
    [events,As]=ListAllTracesThresholded(Threshfxyc,thresh,3);
    
    [Is,Bs]=ManualFitEvents(events,files{i0});
    [Sevents{i0},SAs{i0},SIs{i0},SUppers{i0},SLowers{i0},SDrops{i0}]=ManuallySelectPhotobleaches(events,As,Is);
    Conversion=mean(nonzeros(As))/mean(nonzeros(Is));
    figure
    
%     H=hist(events(:,1),1:MaxFrameFXYC(Threshfxyc));
%    
%     y=H(x).';
%     fm=fit(x,y,'exp1');
%     
%     plot(fm,x,y)
%     [A(i0,:)]=coeffvalues(fm);
%     TC(i0)=1/A(i0,2)*exposure;
    xbins=-1000:100:7000;
    [Selected,Cs]=PlotManualFitChanges_Averages_WManual(events,As,Is*Conversion,xbins);
    %BoxEventsColors(files{i0},newfiles{i0},Selected,Cs);
     %hist(nonzeros(As),xbins)
    
%     Avs=TabulateTraceAverages(events,Is*Conversion);
%     hist(Avs,xbins)
%     xlim([0 8000])
%     title(strcat('Trace Averages.  Median=', num2str(median(Avs))))
%     figure
%     
     [Drops,Uppers,RValues]=TabulateManualFitChanges_Averages(events,As); %Gaussian
%     %fits
     %[Drops,Uppers,RValues]=TabulateManualFitChanges_Averages(events,Is*Conversion); %Manual
%     %fits
%Goo=find(RValues>.5);
Goo=find(Uppers);
figure
hist(Drops(Goo),xbins)
figure
hist(Uppers(Goo),xbins)
%     hist(nonzeros(Uppers),xbins)
%     xlim([0 8000])
%     title(strcat('Average Value before drop. Median=', num2str(median(nonzeros(Uppers)))))
%     figure
%     DropsN=TabulateManualFitChanges_Neighbors(events,Is*Conversion); %Best results so
%     hist(nonzeros(DropsN),xbins)
%     xlim([-4000 8000])
%     title(strcat('Average Neighbor Drop Value. Median=',num2str(median(nonzeros(DropsN)))))
%     figure
%     %far 10/10/17
%     hist(nonzeros(Drops),1000)
%     xlim([-4000 8000])
%     title(strcat('Average Drop Value. Median=',num2str(median(nonzeros(Drops)))))
    %H=hist(nonzeros(Drops),xbins);
%     for i=1:length(H)
%         Hs(i)=H(i)-H(length(H)+1-i);
%     end
    %figure
    %plot(xbins,Hs)
    %xlim([0 8000])
    

end
    