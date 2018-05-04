clear N Ni Nc Navi
FrameGap=3;
MaxFrame=100;
Tmast=3000;
Tslave=3000;
folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
for i0=1:length(files)
    load(files{i0});
    [Ni(i0),Nc(i0)]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave);
    Ni(i0)=Ni(i0)/Area(i0);
    Nc(i0)=Nc(i0)/Area(i0);
end
    Navi(1)=mean(Ni);
    Navc(1)=mean(Nc);

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Red_FXYCMS*');
for i=1:length(files)
    load(files{i})
    [Ni(26),Nc(26)]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave);
    Ni(26)=Ni(26)/Area_WT_009;
    Nc(26)=Nc(26)/Area_WT_009;
end
    Navi(2)=Ni(26);
    Navc(2)=Nc(26);

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*003*Red_FXYCMS*');
for i=1:length(files)
    load(files{i})
    [Ni(27),Nc(27)]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave);
    Ni(27)=Ni(27)/Area_WT_003;
    Nc(27)=Nc(27)/Area_WT_003;
end
    Navi(2)=(Ni(27)+Navi(2))/2;
    Navc(2)=(Nc(27)+Navc(2))/2;
    
    
figure
bar([Ni.' Nc.']/5)
figure
Obj=bar([Navi.' Navc.']/5);
%L={'0-45s Pits','45-90s Pits','90-135s Pits','Stalled Structures'};
%legend(fliplr(Obj),fliplr(L));
ylabel('Number/um^2/min')
%ylim([0 1])
xticklabels({'CALM siRNA','Control'})
legend('Initiations','Conclusions')