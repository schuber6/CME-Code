%ONLY WORKS FOR 3dt MOVIES WITH 5 PLANES

clear all
%exp_name='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo\170520_Analysis\movies';
exp_name='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
moviefold='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells\Split Channels';
omd=fullfile(exp_name);
omdM=fullfile(moviefold);
rbins=1:50;
rbins=rbins/50*5;
%for i0=1:3
    SM=strcat('*3d','*AP2.mat');
    SS=strcat('*3d','*CLCa*mat');
    MM=strcat('*3d','*AP2*tif');
    MS=strcat('*3d','*CLCa*tif');
tmpdm = dir(fullfile(omd,SM));
tmpds = dir(fullfile(omd,SS));
Mtmpdm = dir(fullfile(omdM,MM));
Mtmpds = dir(fullfile(omdM,MS));
XL=[0 0];
YL=[0 0];
clear t
%figure
h=waitbar(0,'Linking and Z Gaussing');
for i=2:length(tmpdm)
    waitbar(i/length(tmpdm))
    %subplot(3,ceil(length(tmpdm)/3),i)
    moviesM{i} = fullfile(omd,tmpdm(i).name);
    moviesS{i} = fullfile(omd,tmpds(i).name);
    MmoviesM{i} = fullfile(omdM,Mtmpdm(i).name);
    MmoviesS{i} = fullfile(omdM,Mtmpds(i).name);
    NF=strcat(moviesM{i}(1:end-4),'LinkedMS_ZGauss.mat');
    load(moviesM{i})
    NSTAm=NSTA;
    load(moviesS{i})
    NSTAs=NSTA;
    NSTAms=LinkMS_3dt(NSTAm,NSTAs);
    
    NSTAms=AddManualZProfiles_3dt(NSTAms,5,MmoviesM{i}); 
    NSTAms=AddManualZProfiles_Slave_3dt(NSTAms,5,MmoviesS{i});
    %Add back in to do manual Z fitting
    
    %t(i)=(i-2)*3-1;
    %ScatterMSst(NSTAms,t(i));
    %ScatterMstVsAC(NSTAms,t)
    %HistMSstDiff(NSTAms,t(i));
    %MSratios{i0}(i)=mean(MSr{i,i0});
    %MSratiosMed{i0}(i)=median(MSr{i,i0});
    %MSratiosSE{i0}(i)=sqrt(var(MSr{i,i0}))/sqrt(length(MSr{i,i0}));
    save(NF,'NSTAms')
% XLM=max(XL(:,2));
% YLM=max(YL(:,2));
end
close(h)
