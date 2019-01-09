clear all
clear all
load('DoubleSIRNA_ManualCytosolData.mat')
CBS_DSI=CBS_DSI([1 3 4 5 6 7 8]);
Area_DSI=Area_DSI([1 3 4 5 6 7 8]);

folderwt='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
foldersi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
folderdsi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';
fileswt=FindFiles(folderwt,'*Red*.mat');
filessi=FindFiles(foldersi,'*Red*.mat');
filesdsi=FindFiles(folderdsi,'*Red*.mat');

FrameGap=2;
MaxFrame=151;
Tmast=3000;
Tslave=3000;

for i0=1:length(fileswt)
    load(fileswt{i0});
    [Niwt(i0),Ncwt(i0)]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave);
    Niwt(i0)=Niwt(i0)/Area_WT(i0);
    Ncwt(i0)=Ncwt(i0)/Area_WT(i0);
end
Navi(1)=mean(Niwt);
Navc(1)=mean(Ncwt);

for i0=1:length(filessi)
    load(filessi{i0});
    [Nisi(i0),Ncsi(i0)]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave);
    Nisi(i0)=Nisi(i0)/Area_SI(i0);
    Ncsi(i0)=Ncsi(i0)/Area_SI(i0);
end
Navi(2)=mean(Nisi);
Navc(2)=mean(Ncsi);

for i0=1:length(filesdsi)
    load(filesdsi{i0});
    [Nidsi(i0),Ncdsi(i0)]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave);
    Nidsi(i0)=Nidsi(i0)/Area_DSI(i0);
    Ncdsi(i0)=Ncdsi(i0)/Area_DSI(i0);
end
Navi(3)=mean(Nidsi);
Navc(3)=mean(Ncdsi);

figure
bar([Niwt.' Ncwt.']/5)
figure
Obj=bar([Navi.' Navc.']/5);
%L={'0-45s Pits','45-90s Pits','90-135s Pits','Stalled Structures'};
%legend(fliplr(Obj),fliplr(L));
ylabel('Number/um^2/min')
%ylim([0 1])
xticklabels({'WT','SI','DSI'})
legend('Initiations','Conclusions')