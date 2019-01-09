MinLT=10;

clear LTs_si FXYCMS_Sel_si MMs_si MSs_si
ind=1;
folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
filessi=FindFiles(folder,'*FXYCMS.mat').';

Scyt=sort(unique(CALM_Cytosol_BS_rel));
order=[];
for i=1:length(Scyt)
    order=[order find(CALM_Cytosol_BS_rel==Scyt(i))];
end

for i=1:length(filessi)
load(filessi{i})
[FXYCMS_Sel_si,LTs_si{ind},MMs_si{ind},MSs_si{ind}]=SelectSmallOnes(FXYCMS,MinLT);
[FXYCMS_Sel_si,LTs_siL{ind},MMs_siL{ind},MSs_siL{ind}]=SelectLargeOnes(FXYCMS);
NLarge(ind)=length(LTs_siL{ind});
NSmall(ind)=length(LTs_siS{ind});
PLarge(ind)=NLarge(ind)/NSmall(ind);
ind=ind+1;

end


folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*170409*.mat').';
load(files{1})
[FXYCMS_Sel_nsi,LTs_nsi,MMs_nsi,MSs_nsi]=SelectSmallOnes(FXYCMS,MinLT,1:100);
folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*170409*.mat').';
load(files{2})
[FXYCMS_Sel_nsi2,LTs_nsi2,MMs_nsi2,MSs_nsi2]=SelectSmallOnes(FXYCMS,MinLT,1:100);

LTbins=10:3:50;
GFPInt=230;
Sbins=0:5:100;
for i0=1:length(LTs_si)
    i=order(i0);
    [Hsi,xbins]=hist(LTs_si{i},LTbins);
    Hnsi=hist(LTs_nsi,xbins);
    Hnsi2=hist(LTs_nsi2,xbins);
    Hsi=Hsi(1:end-1);
    xbins=xbins(1:end-1);
    Hnsi=Hnsi(1:end-1);
    Hnsi2=Hnsi2(1:end-1);
    figure(1)
    subplot(5,5,i0)
    plot(xbins*3,Hsi/sum(Hsi),'r')
    hold on
    plot(xbins*3,Hnsi/sum(Hnsi),'g')
    plot(xbins*3,Hnsi2/sum(Hnsi2),'g')
    xlabel('Lifetime (s)')
    ylabel('Frequency')
    [~,KSp(i,1)]=kstest2(LTs_si{i},LTs_nsi);
    [~,KSp2(i,1)]=kstest2(LTs_si{i},LTs_nsi2);
    KS=max(KSp(i,1),KSp2(i,1));
    if i==1
    legend('siRNA','WT #1','WT #2')
    title(strcat('KS p-value=',num2str(KS)))
    else
    title(num2str(KS))
    end
end
for i0=1:length(LTs_si)
    i=order(i0);
    [Hsi,xbins]=hist(MMs_si{i},25);
    [Hnsi,xbinsn]=hist(MMs_nsi,25);
    Hnsi2=hist(MMs_nsi2,xbinsn);
    figure(2)
    subplot(5,5,i0)
    plot(xbins,Hsi/sum(Hsi)/(xbins(2)-xbins(1)),'r')
    hold on
    plot(xbinsn,Hnsi/sum(Hnsi)/(xbinsn(2)-xbinsn(1)),'g')
    plot(xbinsn,Hnsi2/sum(Hnsi2)/(xbinsn(2)-xbinsn(1)),'g')
    xlabel('AP2 Intensity at Internalization')
    ylabel('Frequency')
    [~,KSp(i,2)]=kstest2(MMs_si{i},MMs_nsi);
    [~,KSp2(i,2)]=kstest2(MMs_si{i},MMs_nsi2);
    KS=max(KSp(i,2),KSp2(i,2));
    if i==1
    legend('siRNA','WT #1','WT #2')
    title(strcat('KS p-value=',num2str(KS)))
    else
    title(num2str(KS))
    end
end
for i0=1:length(LTs_si)
    i=order(i0);
    [Hsi,xbins]=hist(MSs_si{i}/GFPInt,Sbins);
    [Hnsi,xbinsn]=hist(MSs_nsi/GFPInt,Sbins);
    Hnsi2=hist(MSs_nsi2/GFPInt,xbinsn);
    figure(3)
    subplot(5,5,i0)
    plot(xbins,Hsi/sum(Hsi)/(xbins(2)-xbins(1)),'r')
    hold on
    plot(xbinsn,Hnsi/sum(Hnsi)/(xbinsn(2)-xbinsn(1)),'g')
    plot(xbinsn,Hnsi2/sum(Hnsi2)/(xbinsn(2)-xbinsn(1)),'g')
    xlabel('Number of CALMs at Internalization')
    ylabel('Frequency')
    [~,KSp(i,3)]=kstest2(MSs_si{i},MSs_nsi);
    [~,KSp2(i,3)]=kstest2(MSs_si{i},MSs_nsi2);
    KS=max(KSp(i,3),KSp2(i,3));
    if i==1
    legend('siRNA','WT #1','WT #2')
    title(strcat('KS p-value=',num2str(KS)))
    else
    title(num2str(KS))
    end
    xlim([0 40])
end

%%

for i=1:length(LTs_si)
    for i2=1:length(LTs_si)
        [h(i,i2),p(i,i2)]=kstest2(LTs_si{i},LTs_si{i2});
    end
end

for i=1:length(LTs_si)

        [hn(i),pn(i)]=kstest2(LTs_nsi,LTs_si{i});

end
for i=1:length(MMs_si)

        [hnm(i),pnm(i)]=kstest2(MMs_nsi,MMs_si{i});

end
for i=1:length(MSs_si)

        [hns(i),pns(i)]=kstest2(MSs_nsi,MSs_si{i});

end

figure
scatter(pn,SI_rel(:,1))
xlabel('LT KS p-value')
ylabel('CALM Intensity (Relative to WT)')
figure
scatter(pnm,SI_rel(:,1))
xlabel('AP2 KS p-value')
ylabel('CALM Intensity (Relative to WT)')
figure
scatter(pns,SI_rel(:,1))
xlabel('CALM KS p-value')
ylabel('CALM Intensity (Relative to WT)')

%%

    [~,LTp]=kstest2(LTs_nsi2,LTs_nsi)
    [~,MMp]=kstest2(MMs_nsi2,MMs_nsi)
    [~,MSp]=kstest2(MSs_nsi2,MSs_nsi)