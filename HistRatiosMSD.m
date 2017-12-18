clear all
fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_pre_t_003_MSD.mat';
load(fileSave)
C=[0 1 0];

Ratios=[];
MasterThresh=400;
SlaveThresh=400;
RatioThresh=.5;
for i=1:length(MSD)
    for i2=1:length(MSD{i}(:,1))
        if MSD{i}(i2,4)>=MasterThresh && MSD{i}(i2,5)>=SlaveThresh
            R=MSD{i}(i2,4)/MSD{i}(i2,5);
            if R>=RatioThresh
                Ratios=[Ratios R];
            end
        end
    end
end
xbins=1:50;
xbins=xbins/50*3;
H=hist(Ratios,xbins);
plot(xbins,H,'Color',C);
hold on
xlim([0 3])
median(Ratios)

fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_003_MSD.mat';
load(fileSave)
C=[1 0 0];

Ratios=[];
MasterThresh=400;
SlaveThresh=400;
RatioThresh=.5;
for i=1:length(MSD)
    for i2=1:length(MSD{i}(:,1))
        if MSD{i}(i2,4)>=MasterThresh && MSD{i}(i2,5)>=SlaveThresh
            R=MSD{i}(i2,4)/MSD{i}(i2,5);
            if R>=RatioThresh
                Ratios=[Ratios R];
            end
        end
    end
end
xbins=1:50;
xbins=xbins/50*3;
H=hist(Ratios,xbins);
plot(xbins,H,'Color',C);
xlim([0 3])
median(Ratios)

fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_003_MSD.mat';
load(fileSave)
C=[0 0 1];

Ratios=[];
MasterThresh=400;
SlaveThresh=400;
RatioThresh=.5;
for i=1:length(MSD)
    for i2=1:length(MSD{i}(:,1))
        if MSD{i}(i2,4)>=MasterThresh && MSD{i}(i2,5)>=SlaveThresh
            R=MSD{i}(i2,4)/MSD{i}(i2,5);
            if R>=RatioThresh
                Ratios=[Ratios R];
            end
        end
    end
end
xbins=1:50;
xbins=xbins/50*3;
H=hist(Ratios,xbins);
plot(xbins,H,'Color',C);
xlim([0 3])
median(Ratios)

xlabel('AP2:CLTA Ratio')
ylabel('Count')