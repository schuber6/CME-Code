%exp_name='E:\CME Superfolder\CME Data\170725_BSC_3dControl';
%exp_name='E:\CME Superfolder\CME Data\170628_NSTAs';
%exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
%exp_name='E:\CME Superfolder\CME Data\170807_JaspAndControl';
tmpd = dir(fullfile(exp_name,'*.mat'));
%zgL=[400 400 400 400 400 400 400 400]; %Esra
 %fgL=[3 3 3 3 3 3 3 3];
 %CL=[1 1 1 1 1 1 1 1];
 zgL=[300 300 400 400 500 500 500 300 300 400 500 500 500 400 500 500 700 700];
 fgL=[.6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6]; %Ylis
 %zgL=[300 300 300 300 300 300 300 300];
 %fgL=[4 4 4 4 4 4 4 4];
 %CL=[1 1 2 3 2 2 3 3];
 CL=[1 1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3]; %Ylis
 Nbins=2;
 ZCellG=cell(max(CL),Nbins*2+1);
for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    
    load(movies{i0});
    [ZcellNO,INTcellNO,FcellNO,indsNO]=MakeCellsFromNSTAOnly0LastN_Offset(NSTA,NF);
    minnum=8;
    NT=length(ZcellNO);
    
    [clusters] = createTraceLibrary_Temp(ZcellNO,3,floor(NT/minnum),8,0,0); %Sinker
%     Removal
%     
     [Lifters,Flat,Sinkers,N(i0,1),N(i0,2),N(i0,3),N(i0,4),N(i0,5),N(i0,6)]=FindLifters(clusters);
%     NSTA=RemoveSinkers(NSTA,Sinkers,indsNO);
NSTA=SelectLiftersFlat(NSTA,Lifters,Flat,indsNO);
    [Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTA(NSTA);
    [LvZ,LsZ,LvI,LsI,LvF,LsZL]=LinkedSlopesWrapper_GenBins(NSTA,fgL(i0),zgL(i0),Nbins);
    %DataCK=LinkedSlopesWrapper_Range(NSTA,beg,fin,zg,CW);
    for i1=1:length(LsZL)
        ZCellG{CL(i0),i1}=[ZCellG{CL(i0),i1} zgL(i0)*LsZL{i1}];
    end
end
figure
clear msL sdsL sesL
for i=1:max(CL)
    for i2=1:length(LsZL)
        msL(i2)=mean(ZCellG{i,i2});
        sdsL(i2)=sqrt(var((ZCellG{i,i2})));
        sesL(i2)=sdsL(i2)/sqrt(length(ZCellG{i,i2}));
    end
    errorbar(msL,sesL)
    hold on
    Data{i}=[msL ; sdsL ; sesL];
end
legend('Control','Jasp','QQN')