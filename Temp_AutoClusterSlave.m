
%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
%exp_name='E:\CME Superfolder\CME Data\170616_Analysis';
%exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
%exp_name='E:\CME Superfolder\CME Data\170628_NSTAs';
%exp_name='E:\CME Superfolder\CME Data\170725_BSC_3dControl';
exp_name='E:\CME Superfolder\CME Data\170816_LifeactCyclo';
tmpd = dir(fullfile(exp_name,'*v3.mat'));
NF=20;
Smoothing=20;
% fg=[0 .6 .4 2.5 2.5 .6 .4 2.5 2.5];
% zg=[0 100 200 200 200 100 200 200 200];
 %fg=[4 4 4 4 4 4 4 4 4];
 %fg=[3 3 3 3 3 3 3 3 3];
 fg=3;
 zg=1;
 %zgL=[300 300 400 400 500 500 500 300 300 400 500 500 500 400 500 500 700
 %700]; %Ylis
 zgL=[400 400 400 400 400 400 400 400];
 %fgL=[0 0 0 0 0 .6 .4 2.5 2.5 .6];
 %fgL=[.6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6 .6]; Ylis
 fgL=[3 3 3 3 3 3 3 3];
 CL=[1 1 1 1 1 1 1 1];
 %CL=[1 1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3];
 %zg=[400 400 400 400 400 400 400 400];
 h=waitbar(0,'clustering');
 CM=cell(3,5);
 LsZLT=cell(3,5);
 LifterLs=cell(1,length(tmpd));
 LifterSs=cell(1,length(tmpd));
 LifterRs=cell(1,length(tmpd));
 SinkerLs=cell(1,length(tmpd));
 SinkerSs=cell(1,length(tmpd));
 SinkerRs=cell(1,length(tmpd));
 NTracesConds=zeros(2,length(tmpd));
%  for im1=1:10
%      fgL(7)=12/im1;
LsZL=cell(2,5);
for i0=1:length(tmpd)
    figure
%     for W=1:2
%         beg=(W-1)*100+1;
%         fin=W*100;
%         if W==1
%             CW=[0 0 1];
%         else
%             CW=[1 0 0];
%         end
    waitbar(i0/length(tmpd))
    fg=fgL(i0);
    zg=zgL(i0);
%     if CL(i0)==1
%         C=[1 0 0];
%     end
%     if CL(i0)==2
%         C=[0 1 0];
%     end
%     if CL(i0)==3
%         C=[0 0 1];
%     end
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    
    load(movies{i0});
    [ZcellNO,INTcellNO,FcellNO,indsNO,ScellNO]=MakeCellsFromNSTAOnly0LastN_Offset_Slave(NSTAgood,NF);
    minnum=8;
    NT=length(ZcellNO);
    %[clusters] = createTraceLibrary_Temp(ZcellNO,3,floor(NT/minnum),8,0,0);
    [clusters2] = createTraceLibrary_Temp(ScellNO,3,floor(NT/minnum),8,0,1);
    
    %[Lifters,Flat,Sinkers,N(i0,1),N(i0,2),N(i0,3),N(i0,4),N(i0,5),N(i0,6)]=FindLifters(clusters);
    %[Lt,Ft,St]=TimelineLifters(Lifters,Flat,Sinkers,NSTA,Smoothing,indsNO);
    %[LifterMed,SinkerMed,FlatMed]=PlotAverageLifterTraces(Lifters,Flat,Sinkers,NSTA,indsNO,NF,fg,zg);
    %HistLifterMeds(LifterMed,SinkerMed,FlatMed);
    %NSTArem=SelectLiftersFlat(NSTA,Lifters,Flat,indsNO);
    %NSTArem=RemoveSinkers(NSTA,Sinkers,indsNO);
    %NTraces(CL(i0))=NTraces(CL(i0))+length(NSTArem);
%     [LvZ,LsZ,LvI,LsI,LvF]=LinkedSlopesWrapper_GenBins(NSTA,fg,zg);
     %[LvZ,LsZ,LvI,LsI,LvF,M,SE,LsZL]=OnlyLinkedSlopesWrapper_GenBins(NSTArem,fg,zg,C,0);
%     [LifterLs{i0},LifterSs{i0},SinkerLs{i0},SinkerSs{i0},LifterRs{i0},SinkerRs{i0}]=FindTraceLiftStats(Lifters,Sinkers,indsNO,NSTA);
    %[DataCK{W,i0},LsZLtemp,NTracesConds(W,i0)]=LinkedSlopesWrapper_Range(NSTA,beg,fin,zg,CW,fg);
%     for i=1:5
%    LsZL{W,i}=[LsZL{W,i} LsZLtemp{i}];
%     end
% %         for i=1:5
% %             %CM{CL(i0),i}=[CM{CL(i0),i} M(i)];
% %             LsZLT{CL(i0),i}=[LsZLT{CL(i0),i} LsZL{i}*zg*3/fg];
% %         end
%     end
% % end
 end
% figure
% for i=1:2
%     for i2=1:5
%         ms(i,i2)=mean(LsZL{i,i2});
%         sds(i,i2)=sqrt(var((LsZL{i,i2})))/sqrt(length(LsZL{i,i2}));
%     end
%     errorbar([-2 -1 0 1 2],ms(i,:),sds(i,:))
%     hold on
% end
% legend('Control','Osmo')
% figure
% Hi=zeros(2,5);
% for i=1:2
%     
%     for i2=1:length(tmpd)
%         for i3=1:5
%             Hi(i,i3)=Hi(i,i3)+DataCK{i,i2}{5}(i3);
%         end
%     end
%     
% end
% plot(Hi(1,:))
%     hold on
%     plot(Hi(2,:))
%     title('GRH')
% for i=1:3
%     for i2=1:5
%         msL(i2)=mean(LsZLT{i,i2});
%         sdsL(i2)=sqrt(var((LsZLT{i,i2})));
%         sesL(i2)=sdsL(i2)/sqrt(length(LsZLT{i,i2}));
%     end
%     errorbar([-2 -1 0 1 2],msL,sdsL)
%     hold on
%     Data{i}=[msL ; sdsL ; sesL];
% end
% legend('Control','Jasp','QQN')
% title('SD')
% figure
% for i=1:3
%     for i2=1:5
%         msL(i2)=mean(LsZLT{i,i2});
%         sdsL(i2)=sqrt(var((LsZLT{i,i2})));
%         sesL(i2)=sdsL(i2)/sqrt(length(LsZLT{i,i2}));
%     end
%     errorbar([-2 -1 0 1 2],msL,sesL)
%     hold on
%     %Data{i}=[msL ; sdsL ; sesL];
% end
% legend('Control','Jasp','QQN')
% title('SE')
close(h)