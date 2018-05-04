Msd=[];
Ssd=[];
MM=[];
MS=[];
MI=[];
SI=[];
MSr=[];
N=[];
LT=[];

folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*.mat').';
h=waitbar(0,'Analyzing Movies');
for i=1:length(files)
    waitbar(i/length(files))
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1,LT1]=OsmoshockParameters(files{i});
    Msd=[Msd ; Msd1];
    Ssd=[Ssd ; Ssd1];
    MM=[MM ; MM1];
    MS=[MS ; MS1];
    MI=[MI ; MI1];
    SI=[SI ; SI1];
    MSr=[MSr ; MSr1];
    N=[N ; N1];
    LT=[LT ; LT1];
    ind=length(Msd(:,1));
    Titles{ind}='siRNA control';
end
close(h)

%%



folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*170409*.mat').';
h=waitbar(0,'Analyzing Movies');
for i=1:length(files)
    waitbar(i/length(files))
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1,LT1]=OsmoshockParameters(files{i});

end
close(h)

Msd_NS=Msd1;
Ssd_NS=Ssd1;
MM_NS=MM1;
MS_NS=MS1;
MI_NS=MI1;
SI_NS=SI1;
MSr_NS=MSr1;
N_NS=N1;
LT_NS=LT1;

Msd_rel=Msd/Msd_NS(1);
Ssd_rel=Ssd/Ssd_NS(1);
MM_rel=MM/MM_NS(1);
MS_rel=MS/MS_NS(1);
MI_rel=MI/MI_NS(1);
SI_rel=SI/SI_NS(1);
MSr_rel=MSr/MSr_NS(1);
N_rel=N/N_NS(1);
LT_rel=LT/LT_NS(1);
