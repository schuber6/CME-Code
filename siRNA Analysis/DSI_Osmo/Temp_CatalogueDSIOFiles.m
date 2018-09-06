clear all

load('180820_OsmoPs.mat')
Osmos20=Osmos;
load('180821_OsmoPs.mat')
Osmos21=Osmos;

folder{5}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 3 min\Traces';
folder{6}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 10 min\Traces';
folder21{5}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 3 min 21\Traces';
folder21{6}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 10 min 21\Traces';
folder{4}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Traces';
folder21{4}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont 21\Traces';
folder{2}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min\Traces';
folder21{2}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min 21\Traces';
folder{3}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min\Traces';
folder21{3}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min 21\Traces';
folder{1}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont\Traces';
folder21{1}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont 21\Traces';

folder0{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Traces';
folder0{5}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Traces';
folder0{6}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Traces';
folder0{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Traces';
folder0{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Traces';
folder0{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Traces';

sig=0;
Indiv=0;
YL=[0 .05];

DSIOfiles=struct;
ind=1;

for i=1:length(folder)
    files{i}=FindFiles(folder{i},'*FXYCMS*').';
    found=[];
    if i==3 || i==6
        
        for i2=1:length(files{i})
            if ~isempty(strfind(files{i}{i2},'10m'))
                found=[found i2];
            end
        end
        files{i}=files{i}(found);
    end
    nums=zeros(1,length(files{i}));
    for i2=1:length(files{i})
        num=files{i}{i2}(end-20:end-18);
        nums(i2)=str2num(num);
        pWater{i}(i2)=Osmos20(nums(i2),2);
    end
    
    Zfold=strcat(folder{i}(1:end-6),'ZStacks');
    AF=FindFiles(Zfold,'*Areas_RG*');
    load(AF{1});
    AreaC{i}=mean(RedArea,2);
    if ~isempty(found)
        AreaC{i}=AreaC{i}(found);
    end
    for i2=1:length(files{i})
        DSIOfiles(ind).file=files{i}{i2};
        DSIOfiles(ind).area=AreaC{i}(i2);
        DSIOfiles(ind).pWater=pWater{i}(i2);
        DSIOfiles(ind).TimeGroup=mod(i-1,3);
        DSIOfiles(ind).siRNA=floor((i-1)/3);
        DSIOfiles(ind).Day=1;
        ind=ind+1;
    end
end


for i=1:length(folder21)
    files21{i}=FindFiles(folder21{i},'*FXYCMS*').';
    found=[];
    if i==3 || i==6
        for i2=1:length(files21{i})
            if ~isempty(strfind(files21{i}{i2},'10m'))
                found=[found i2];
            end
        end
        files21{i}=files21{i}(found);
    end
    nums=zeros(1,length(files21{i}));
    for i2=1:length(files21{i})
        num=files21{i}{i2}(end-20:end-18);
        nums(i2)=str2num(num);
        pWater21{i}(i2)=Osmos21(nums(i2),2);
    end
    
    Zfold=strcat(folder21{i}(1:end-6),'ZStacks');
    AF=FindFiles(Zfold,'*Areas_RG*');
    load(AF{1});
    AreaC21{i}=mean(RedArea,2);
    if ~isempty(found)
        AreaC21{i}=AreaC21{i}(found);
    end
    for i2=1:length(files21{i})
        DSIOfiles(ind).file=files21{i}{i2};
        DSIOfiles(ind).area=AreaC21{i}(i2);
        DSIOfiles(ind).pWater=pWater21{i}(i2);
        DSIOfiles(ind).TimeGroup=mod(i-1,3);
        DSIOfiles(ind).siRNA=floor((i-1)/3);
        DSIOfiles(ind).Day=2;
        ind=ind+1;
    end
end

for i=1:length(folder0)
    files21{i}=FindFiles(folder0{i},'*FXYCMS*').';
    found=[];
    if i==3 || i==6
        for i2=1:length(files21{i})
            if ~isempty(strfind(files21{i}{i2},'10m'))
                found=[found i2];
            end
        end
        files21{i}=files21{i}(found);
    end
    nums=zeros(1,length(files21{i}));
    for i2=1:length(files21{i})
        num=files21{i}{i2}(end-20:end-18);
        nums(i2)=str2num(num);
        %pWater21{i}(i2)=Osmos21(nums(i2),2);
    end
    
    Zfold=strcat(folder0{i}(1:end-6),'ZStacks');
    AF=FindFiles(Zfold,'*Areas_RG*');
    load(AF{1});
    AreaC21{i}=mean(RedArea,2);
    if ~isempty(found)
        AreaC21{i}=AreaC21{i}(found);
    end
    for i2=1:length(files21{i})
        DSIOfiles(ind).file=files21{i}{i2};
        DSIOfiles(ind).area=AreaC21{i}(i2);
        DSIOfiles(ind).pWater=80;
        DSIOfiles(ind).TimeGroup=mod(i-1,3);
        DSIOfiles(ind).siRNA=floor((i-1)/3);
        DSIOfiles(ind).Day=0;
        ind=ind+1;
    end
end

%%

clear all
load('BothDSIO_DSIOFilesStruct.mat')
for i=1:length(DSIOfiles)
    A=DSIOfiles(i).file;
    n=strfind(A,'Traces');
    B=strcat(A(1:n-1),'Movies',A(n+6:end));
    C=strcat(B(1:end-11),'.tif');
    D=strcat(B(1:end-14),'Green.tif');
    DSIOfiles(i).movieR=C;
    DSIOfiles(i).movieG=D;
end

%%


clear all
thresh=1000;
Rang=1:151;
load('BothDSIO_DSIOFilesStruct.mat')
for i=1:length(DSIOfiles)
    A=DSIOfiles(i).file;
    load(A)
    [MI,SI]=FindAllMasterSlaveIntensities_InRange(FXYCMS,Rang,thresh);
    DSIOfiles(i).MedianClath=median(MI);
    DSIOfiles(i).MedianCALM=median(SI);
end

%%
%clear all
Tmast=0;
MinLTF=5;
FrameGap=2;
%load('BothDSIO_DSIOFilesStruct.mat')
for i=1:length(DSIOfiles)
    A=DSIOfiles(i).file;
    load(A)
    [Ncwt]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
    DSIOfiles(i).NConclusions=Ncwt;
end

%%
%clear all
Tmast=1000;
MinLTF=10;
FrameGap=2;
%load('BothDSIO_DSIOFilesStruct.mat')
for i=1:length(DSIOfiles)

    DSIOfiles(i).ConcsPerArea=DSIOfiles(i).NConclusions/DSIOfiles(i).area;
end


%%
clear all
Tmast=1000;
MinLTF=10;
FrameGap=2;
load('BothDSIO_DSIOFilesStruct.mat')
for i=1:length(DSIOfiles)
    A=DSIOfiles(i).file;
    load(A)
    [slopeM,slopeS]=JoshSlopes_FXYCMS(FXYCMS);
    DSIOfiles(i).GRSDclath=sqrt(var(slopeM));
    DSIOfiles(i).GRSDcalm=sqrt(var(slopeS));
end

%%
clear all
Tmast=1000;
MinLTF=10;
FrameGap=2;
load('BothDSIO_DSIOFilesStruct.mat')
for i=1:length(DSIOfiles)
    A=DSIOfiles(i).file;
    load(A)
    [N]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF);
    DSIOfiles(i).SpotsPerFramePerArea=N/DSIOfiles(i).area;
end

%%

clear all
Tmast=0;
MinLTF=5;
FrameGap=2;
load('BothDSIO_DSIOFilesStruct.mat')
for i=1:length(DSIOfiles)
    A=DSIOfiles(i).file;
    load(A)
    [Ncwt,~,~,~,~,~,~,~,MS{i}]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
    DSIOfiles(i).NConclusions=Ncwt;
    DSIOfiles(i).ConcsPerArea=DSIOfiles(i).NConclusions/DSIOfiles(i).area;
end
save('BothDSIO_Struct_180831.mat','DSIOfiles','MS')

%%

for i=1:length(DSIOfiles)
    A=DSIOfiles(i).file;
    DSIOfiles(i).NStall=length(MedS{i});
    DSIOfiles(i).NStallPerArea=DSIOfiles(i).NStall/DSIOfiles(i).area;
    DSIOfiles(i).StallCALMMedian=median(MedS{i});
    DSIOfiles(i).StallCALMMax=median(MedS{i});
end