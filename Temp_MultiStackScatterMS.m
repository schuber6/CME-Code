clear all
exp_name='E:\CME Superfolder\CME Data\170907_CALM_CLCa_1StackOsmo';
omd=fullfile(exp_name);
rbins=1:50;
rbins=rbins/50*5;
for i0=2:2
    SM=strcat('*00',num2str(i0),'_GFP_BS_Stack*mat');
    SS=strcat('*00',num2str(i0),'_RFP_BS_Stack*mat');
tmpdm = dir(fullfile(omd,SM));
tmpds = dir(fullfile(omd,SS));
XL=[0 0];
YL=[0 0];
clear t
figure
for i=1:length(tmpdm)
    subplot(3,ceil(length(tmpdm)/3),i)
    moviesM{i} = fullfile(omd,tmpdm(i).name);
    moviesS{i} = fullfile(omd,tmpds(i).name);
    load(moviesM{i})
    NSTAm=NSTA;
    load(moviesS{i})
    NSTAs=NSTA;
    NSTAms=LinkMS(NSTAm,NSTAs);
    t(i)=(i-2)*3-1;
    [XL,YL,slope,intercept,rsq,M{i,i0},S{i,i0},MSr{i,i0}]=ScatterMS(NSTAms,t(i));
    MSratios{i0}(i)=mean(MSr{i,i0});
    MSratiosMed{i0}(i)=median(MSr{i,i0});
    MSratiosSE{i0}(i)=sqrt(var(MSr{i,i0}))/sqrt(length(MSr{i,i0}));
    
end
XLM=max(XL(:,2));
YLM=max(YL(:,2));
for i=1:length(tmpdm)
    subplot(3,ceil(length(tmpdm)/3),i)
    xlim([0 XLM])
    ylim([0 YLM])
end
figure
    errorbar(t,MSratios{i0}/MSratios{i0}(1),MSratiosSE{i0}/MSratios{i0}(1));
    title('Means')
    figure
    errorbar(t,MSratiosMed{i0}/MSratiosMed{i0}(1),MSratiosSE{i0}/MSratiosMed{i0}(1));
    title('Medians')
    figure
    for i=1:length(tmpdm)
        subplot(3,ceil(length(tmpdm)/3),i)
        hist(MSr{i,i0},rbins)
        xlim([0 5])
    end
    figure
    for i=1:length(tmpdm)
        subplot(3,ceil(length(tmpdm)/3),i)
        hist(M{i,i0},100)
        xlim([0 5000])
    end
    figure
    for i=1:length(tmpdm)
        subplot(3,ceil(length(tmpdm)/3),i)
        hist(S{i,i0},100)
        xlim([0 5000])
    end
end