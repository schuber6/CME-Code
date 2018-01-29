clear all
exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*medB.mat'));
usedc=[2 3 5 6 7 9 10];
CutoffR=.6;
%load('E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_GFP_BS_fxycMS_prev_medB.mat')
%load('E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_osmo_GFP_BS_fxycMS_prev_medB.mat')
for i0=1:length(usedc)
    clear slopeB slopeE interceptB interceptE rsqB rsqE
    i00=usedc(i0);
    movies{i00} = fullfile(omd,tmpd(i00).name);
    fileFXYC{i00}=strcat(movies{i00}(1:end-4),'.mat');

load(fileFXYC{i00})
h=waitbar(0,'Pulling Trace Data');
used=find(fxycMS(1,4,:)==3);
%Data=zeros(length(used),12);
count=0;
for i=1:length(used)
    waitbar(i/length(used))
    usedF=find(fxycMS(:,1,used(i)));
    usedT=find(fxycMS(:,6,used(i))>0 & fxycMS(:,9,used(i))>0);
    M=find(fxycMS(:,6,used(i))==max(fxycMS(:,6,used(i))));
    if ~isempty(usedT)
    Mu=find(usedT==M(1));
    if ~isempty(Mu) %Don't want to include traces where master max corresponds to negative slave
    usedT=usedT(1:Mu(1)); %Stop tracking after Mint reaches max--don't want to include uncoating
    MC=max(fxycMS(:,6,used(i)));
    MA=max(fxycMS(:,9,used(i)));
    if ~isempty(usedT) && length(usedT)>=10
        T=length(usedF);
        usedB=[];
        usedE=[];
        for i2=1:T
            if i2<=floor(T/2)
                usedB=[usedB usedF(i2)];
            else
                usedE=[usedE usedF(i2)];
            end
        end
        MastB=fxycMS(usedB,9,used(i));
        SlaveB=fxycMS(usedB,6,used(i));
        MastE=fxycMS(usedE,9,used(i));
        SlaveE=fxycMS(usedE,6,used(i));
        CB=corr([MastB  SlaveB]);
        CE=corr([MastE SlaveE]);
        if CB(1,2)>=CutoffR && CE(1,2)>=CutoffR
            count=count+1;
            [slopeB1, interceptB1, rsqB1]=LinearSlopeInterceptandR2(MastB,SlaveB);
            [slopeE1, interceptE1, rsqE1]=LinearSlopeInterceptandR2(MastE,SlaveE);
            
            
            
            [slopeB(count), interceptB(count), rsqB(count)]=LinearSlopeInterceptandR2(MastB,SlaveB);
            
            [slopeE(count), interceptE(count), rsqE(count)]=LinearSlopeInterceptandR2(MastE,SlaveE);
        end 
    end
    end
    end
end
close(h)

figure('units','normalized','outerposition',[0 0 1 1])
scatter(slopeB,slopeE)
%AddLinearRegLine(slopeB,slopeE)
C=corr([slopeB.' slopeE.']);
yb=mean(slopeE);
SSt=0;
SSr=0;
for i=1:length(slopeE)
    SSt=SSt+(slopeE(i)-yb)^2;
    SSr=SSr+(slopeE(i)-slopeB(i))^2;
end
R2c(i0)=1-SSr/SSt;
XL=xlim;
YL=ylim;
% ylim([min(XL(1),YL(1)) max(XL(2),YL(2))])
% xlim([min(XL(1),YL(1)) max(XL(2),YL(2))])
xlim([0 2])
ylim([0 2])
XL=xlim;
line(XL,XL)
xlabel('Slope of the First Half of the Trace')
ylabel('Slope of the Last Half of the Trace')
title(strcat('y=x R^2=',num2str(R2c(i0))))
end


exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*medB.mat'));


%load('E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_GFP_BS_fxycMS_prev_medB.mat')
%load('E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_osmo_GFP_BS_fxycMS_prev_medB.mat')
for i0=1:length(tmpd)
    clear slopeB slopeE interceptB interceptE rsqB rsqE
    
    movies{i0} = fullfile(omd,tmpd(i0).name);
    fileFXYC{i0}=strcat(movies{i0}(1:end-4),'.mat');

load(fileFXYC{i0})
h=waitbar(0,'Pulling Trace Data');
used=find(fxycMS(1,4,:)==3);
%Data=zeros(length(used),12);
count=0;
for i=1:length(used)
    waitbar(i/length(used))
    usedF=find(fxycMS(:,1,used(i)));
    usedT=find(fxycMS(:,6,used(i))>0 & fxycMS(:,9,used(i))>0);
    M=find(fxycMS(:,6,used(i))==max(fxycMS(:,6,used(i))));
    if ~isempty(usedT)
    Mu=find(usedT==M(1));
    if ~isempty(Mu) %Don't want to include traces where master max corresponds to negative slave
    usedT=usedT(1:Mu(1)); %Stop tracking after Mint reaches max--don't want to include uncoating
    MC=max(fxycMS(:,6,used(i)));
    MA=max(fxycMS(:,9,used(i)));
    if ~isempty(usedT) && length(usedT)>=10
        T=length(usedF);
        usedB=[];
        usedE=[];
        for i2=1:T
            if i2<=floor(T/2)
                usedB=[usedB usedF(i2)];
            else
                usedE=[usedE usedF(i2)];
            end
        end
        MastB=fxycMS(usedB,9,used(i));
        SlaveB=fxycMS(usedB,6,used(i));
        MastE=fxycMS(usedE,9,used(i));
        SlaveE=fxycMS(usedE,6,used(i));
        CB=corr([MastB  SlaveB]);
        CE=corr([MastE SlaveE]);
        if CB(1,2)>=CutoffR && CE(1,2)>=CutoffR
            count=count+1;
            [slopeB1, interceptB1, rsqB1]=LinearSlopeInterceptandR2(MastB,SlaveB);
            [slopeE1, interceptE1, rsqE1]=LinearSlopeInterceptandR2(MastE,SlaveE);
            
            
            
            [slopeB(count), interceptB(count), rsqB(count)]=LinearSlopeInterceptandR2(MastB,SlaveB);
            
            [slopeE(count), interceptE(count), rsqE(count)]=LinearSlopeInterceptandR2(MastE,SlaveE);
        end 
    end
    end
    end
end
close(h)

figure('units','normalized','outerposition',[0 0 1 1])
scatter(slopeB,slopeE)
%AddLinearRegLine(slopeB,slopeE)
C=corr([slopeB.' slopeE.']);
yb=mean(slopeE);
SSt=0;
SSr=0;
for i=1:length(slopeE)
    SSt=SSt+(slopeE(i)-yb)^2;
    SSr=SSr+(slopeE(i)-slopeB(i))^2;
end
R2a(i0)=1-SSr/SSt;
XL=xlim;
YL=ylim;
% ylim([min(XL(1),YL(1)) max(XL(2),YL(2))])
% xlim([min(XL(1),YL(1)) max(XL(2),YL(2))])
xlim([0 2])
ylim([0 2])
XL=xlim;
line(XL,XL)
xlabel('Slope of the First Half of the Trace')
ylabel('Slope of the Last Half of the Trace')
title(strcat('y=x R^2=',num2str(R2a(i0))))
end