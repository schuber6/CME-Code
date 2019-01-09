%Gives Distributions of max gaussian ints (MI) and max pixel-sum ints (MMI)
%given a single florophore intensity of GFPInt for gaussian and MGFPINT for
%pixel-sum.
%The traces selected are chosen by FindGoodTraceMaxInts

exp_name='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies';
%exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';

tmpd = dir(fullfile(exp_name,'*.mat'));
LastN=10;
N=9;
GFPInt=31;
MGFPINT=18400/80;
%thresh=500;
MinNum=3;
xbins=1:2:200;
% for i=1:7 %1:length(tmpd)
%     %Good=[6 13 14 15 16 17 18 19 20 21];
%     Good=[6 7 8 9 10 11 13];
%     i0=Good(i);
%     movies{i0} = fullfile(exp_name,tmpd(i0).name);
%     files{i0}=strcat(movies{i0}(1:end-4),'.tif');
%     newfiles{i0}=strcat(movies{i0}(1:end-4),'_Boxed','.tif');
%     load(movies{i0});
%     [MI,Fs,LTs,TraceFXY,TraceA]=FindGoodTraceMaxInts(Threshfxyc,10);
%     [Selected,Cs]=SelectRandomTraces(TraceFXY,N,TraceA,GFPInt);
%     %BoxEventsColors(files{i0},newfiles{i0},Selected,Cs);
%     LTs=LTs*3;
%     MI=MI/GFPInt;
%     figure
%      hist(MI,xbins)
%      title(strcat('Median=',num2str(median(MI)),'Mean=',num2str(mean(MI))))
%     %scatter(LTs,MI)
%     xlim([0 100])
%     xlabel('Max # AP2s')
%     ylabel('Count')
%     %ylim([0 100])
% end
for i=1 %4:7 %1:length(tmpd)
    %Good=[6 13 14 15 16 17 18 19 20 21];
    %Good=[6 7 8 9 10 11 12 13 14 15];
    %Good=[1 2 3 4 5];
    %Good=[18];
    Good=[22]
    i0=Good(i);
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    files{i0}=strcat(movies{i0}(1:end-4),'.tif');
    newfiles{i0}=strcat(movies{i0}(1:end-4),'_Boxed','.tif');
    load(movies{i0});
    [MI,Fs,LTs,TraceFXY,TraceA]=FindGoodTraceMaxInts(Threshfxyc,10);
    h=waitbar(0,'Manual Fitting');
    MMI=[];
    indices=[];
    FullFXY=[];
    for i2=1:length(TraceFXY)
        waitbar(i2/length(TraceFXY))
        [Is,Bs]=ManualFitEvents_BackR(TraceFXY{i2},files{i0},3,0,'sum');
        MMI(i2)=max(Is);
        ManI{i2}=Is;
    end
    close(h)
    [Selected,Cs]=SelectRandomTraces(TraceFXY,N,TraceA,GFPInt);
    %BoxEventsColors(files{i0},newfiles{i0},Selected,Cs);
    LTs=LTs*3;
    MI=MI/GFPInt;
    MMI=MMI/MGFPINT;
%     figure
%      hist(MI,xbins)
%      title(strcat('Gaussian Median=',num2str(median(MI)),'Mean=',num2str(mean(MI))))
      figure
      subplot(1,2,1)
     hist(MMI,xbins)
     title(strcat('Pixel Sum Median=',num2str(median(MMI)),'Mean=',num2str(mean(MMI))))
    %scatter(LTs,MI)
    xlim([0 200])
    YL=ylim;
    %line([26 26],YL)
    xlabel('Max # DNMs')
    ylabel('Count')
    %ylim([0 100])
    subplot(1,2,2)
    Cohort_AverageTraces;
end