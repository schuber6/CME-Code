%ONLY WORKS FOR SINGLE STACK MOVIES WITH 5 PLANES

clear all
%exp_name='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo\170520_Analysis\movies';
%exp_name='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
exp_name='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed';
%moviefold='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells\Split Channels';
moviefold='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Full\Isolated Cells\Split Channels';
omd=fullfile(exp_name);
omdM=fullfile(moviefold);
rbins=1:50;
rbins=rbins/50*5;
%for i0=1:3
    SS=strcat('*singlestack','*AP2*mat');
    SM=strcat('*singlestack','*CLCa*mat');
    MS=strcat('*singlestack','*AP2*Stack*tif');
    MM=strcat('*singlestack','*CLCa*Stack*tif');
tmpdm = dir(fullfile(omd,SM));
tmpds = dir(fullfile(omd,SS));
Mtmpdm = dir(fullfile(omdM,MM));
Mtmpds = dir(fullfile(omdM,MS));
XL=[0 0];
YL=[0 0];
clear t
%figure
h=waitbar(0,'Linking and Z Gaussing');
for i=1:length(tmpdm)
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
    NSTAms=LinkMS(NSTAm,NSTAs);
    
    NSTAms=AddManualZProfiles(NSTAms,1:5,MmoviesM{i}); 
    NSTAms=AddManualZProfiles_Slave(NSTAms,1:5,MmoviesS{i});
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
%end
% for i=1:length(tmpdm)
%     subplot(3,ceil(length(tmpdm)/3),i)
%     xlim([0 XLM])
%     ylim([0 YLM])
% end
% figure
%     errorbar(t,MSratios{i0}/MSratios{i0}(1),MSratiosSE{i0}/MSratios{i0}(1));
%     title('Means')
%     figure
%     errorbar(t,MSratiosMed{i0}/MSratiosMed{i0}(1),MSratiosSE{i0}/MSratiosMed{i0}(1));
%     title('Medians')
%     figure
%     for i=1:length(tmpdm)
%         subplot(3,ceil(length(tmpdm)/3),i)
%         hist(MSr{i,i0},rbins)
%         xlim([0 5])
%     end
%     figure
%     for i=1:length(tmpdm)
%         subplot(3,ceil(length(tmpdm)/3),i)
%         hist(M{i,i0},100)
%         xlim([0 5000])
%     end
%     figure
%     for i=1:length(tmpdm)
%         subplot(3,ceil(length(tmpdm)/3),i)
%         hist(S{i,i0},100)
%         xlim([0 5000])
%     end
% end