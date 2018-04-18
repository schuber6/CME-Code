Msd=[];
Ssd=[];
MM=[];
MS=[];
MI=[];
SI=[];
MSr=[];
N=[];

folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\AP2';
files=FindFiles(folder,'*_sirna_control*').';
for i=1:length(files)
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1]=OsmoshockParameters(files{i});
    Msd=[Msd ; Msd1];
    Ssd=[Ssd ; Ssd1];
    MM=[MM ; MM1];
    MS=[MS ; MS1];
    MI=[MI ; MI1];
    SI=[SI ; SI1];
    MSr=[MSr ; MSr1];
    N=[N ; N1];
    ind=length(Msd(:,1));
    Titles{ind}='siRNA control';
end

files=FindFiles(folder,'*_nosirna_control*').';
for i=1:length(files)
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1]=OsmoshockParameters(files{i});
    Msd=[Msd ; Msd1];
    Ssd=[Ssd ; Ssd1];
    MM=[MM ; MM1];
    MS=[MS ; MS1];
    MI=[MI ; MI1];
    SI=[SI ; SI1];
    MSr=[MSr ; MSr1];
    N=[N ; N1];
    ind=length(Msd(:,1));
    Titles{ind}='WT Control';
end

files=FindFiles(folder,'*control_2dt_0*').';
for i=1:length(files)
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1]=OsmoshockParameters(files{i});
    Msd=[Msd ; Msd1];
    Ssd=[Ssd ; Ssd1];
    MM=[MM ; MM1];
    MS=[MS ; MS1];
    MI=[MI ; MI1];
    SI=[SI ; SI1];
    MSr=[MSr ; MSr1];
    N=[N ; N1];
    ind=length(Msd(:,1));
    Titles{ind}='WT Control';
end

files=FindFiles(folder,'*_sirna_osmo*').';
for i=1:length(files)
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1]=OsmoshockParameters(files{i});
    Msd=[Msd ; Msd1];
    Ssd=[Ssd ; Ssd1];
    MM=[MM ; MM1];
    MS=[MS ; MS1];
    MI=[MI ; MI1];
    SI=[SI ; SI1];
    MSr=[MSr ; MSr1];
    N=[N ; N1];
    ind=length(Msd(:,1));
    Titles{ind}='siRNA Osmoshock';
end

files=FindFiles(folder,'*_osmo85p_2dt_0*').';
for i=1:length(files)
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1]=OsmoshockParameters(files{i});
    Msd=[Msd ; Msd1];
    Ssd=[Ssd ; Ssd1];
    MM=[MM ; MM1];
    MS=[MS ; MS1];
    MI=[MI ; MI1];
    SI=[SI ; SI1];
    MSr=[MSr ; MSr1];
    N=[N ; N1];
    ind=length(Msd(:,1));
    Titles{ind}='WT Osmoshock';
end

files=FindFiles(folder,'*nosirna_osmo*').';
for i=1:length(files)
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1]=OsmoshockParameters(files{i});
    Msd=[Msd ; Msd1];
    Ssd=[Ssd ; Ssd1];
    MM=[MM ; MM1];
    MS=[MS ; MS1];
    MI=[MI ; MI1];
    SI=[SI ; SI1];
    MSr=[MSr ; MSr1];
    N=[N ; N1];
    ind=length(Msd(:,1));
    Titles{ind}='WT Osmoshock';
end

files=FindFiles(folder,'*postosmo*').';
for i=1:length(files)
    [Msd1,Ssd1,MM1,MS1,MI1,SI1,MSr1,N1]=OsmoshockParameters(files{i});
    Msd=[Msd ; Msd1];
    Ssd=[Ssd ; Ssd1];
    MM=[MM ; MM1];
    MS=[MS ; MS1];
    MI=[MI ; MI1];
    SI=[SI ; SI1];
    MSr=[MSr ; MSr1];
    N=[N ; N1];
    ind=length(Msd(:,1));
    Titles{ind}='WT Post Osmoshock';
end
