folderwt='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
foldersi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
fileswt=FindFiles(folderwt,'*.mat');
filessi=FindFiles(foldersi,'*.mat');
Cs=[1 2 3];

i=1;
load(fileswt{i})
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,Cs);
[slopesM] = my_slope_finding(IntCellM,2,400);
[slopesS] = my_slope_finding(IntCellS,2,400);


Rmin=.01;
[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);
%figure
subplot(1,2,1)
[HMwt,Mbins]=hist(slopeM,50);
subplot(1,2,2)
[HSwt,Sbins]=hist(slopeS,50);


for i=1:5
    load(fileswt{i})
    [IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,Cs);
    [slopesM] = my_slope_finding(IntCellM,2,400);
    [slopesS] = my_slope_finding(IntCellS,2,400);
    [slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);
    subplot(1,2,1)
    [HMwt,Mbins]=hist(slopeM,Mbins);
    plot(Mbins,HMwt/sum(HMwt),'g')
    hold on
    subplot(1,2,2)
    [HSwt,Sbins]=hist(slopeS,Sbins);
    plot(Sbins,HSwt/sum(HSwt),'r')
    hold on
    MSDwt(i)=sqrt(var(slopeM));
    SSDwt(i)=sqrt(var(slopeS));
end

for i=1:5
    load(filessi{i})
    [IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,Cs);
    [slopesM] = my_slope_finding(IntCellM,2,400);
    [slopesS] = my_slope_finding(IntCellS,2,400);
    
    

    [slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);
    %figure
    subplot(1,2,1)
    [HMsi,Mbins]=hist(slopeM,Mbins);
    plot(Mbins,HMsi/sum(HMsi),'g--')
    hold on
    subplot(1,2,2)
    [HSsi,Sbins]=hist(slopeS,Sbins);
    plot(Sbins,HSsi/sum(HSsi),'r--')
    hold on
    MSDsi(i)=sqrt(var(slopeM));
    SSDsi(i)=sqrt(var(slopeS));
end