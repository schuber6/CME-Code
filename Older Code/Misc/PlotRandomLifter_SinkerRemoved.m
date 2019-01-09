%exp_name='E:\CME Superfolder\CME Data\170725_BSC_3dControl';
exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
%exp_name='E:\CME Superfolder\CME Data\170616_Analysis';
tmpd = dir(fullfile(exp_name,'*.mat'));
NF=20;
 %zgL=[300 300 400 400 500 500 500 300 300 400 500 500 500 400 500 500 700 700]; %Ylis
 %fg=.6; %REMEMBER TO CHANGE
 %fgL=[0 0 0 0 0 .6 .4 2.5 2.5];
 %zgL=[0 0 0 0 0 100 200 200 200];
 zgL=[400 400 400 400 400 400 400 400];
 fgL=[3 3 3 3 3 3 3 3];
 CL=[1 1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3];
 ZGpool=cell(3,5);
 figure
for i0=1:length(tmpd)
    clear LsDL LsZL LsZ LsD
    if CL(i0)==1
        C=[1 0 0];
    end
    if CL(i0)==2
        C=[0 1 0];
    end
    if CL(i0)==3
        C=[0 0 1];
    end
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    [ZcellNO,INTcellNO,FcellNO,indsNO]=MakeCellsFromNSTAOnly0LastN_Offset(NSTA,NF);
    minnum=8;
    NT=length(ZcellNO);
    %[clusters] = createTraceLibrary_Temp(ZcellNO,3,floor(NT/minnum),8,0,0);
    [clusters] = createTraceLibrary_Temp(ZcellNO,3,floor(NT/minnum),8,0,0);
    
    [Lifters,Flat,Sinkers,N(i0,1),N(i0,2),N(i0,3),N(i0,4),N(i0,5),N(i0,6)]=FindLifters(clusters);
    NSTA=RemoveSinkers(NSTA,Sinkers,indsNO);
    [Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTA(NSTA);
    
    [slopesINT,minint] = slope_finding(INTcell,3,0);
    slopesZ = slope_finding_NoNorm(Zcell,3,0);
    ListLinkedSlopes;
    BinZIDslopes;
    % figure
    % scatter(LsDL{1},LsZL{1})
    % hold on
    % xlim([0 10])
    Dbins=1:10;
    Dbins=Dbins/2;
    Zbins=cell(5,10);
    for im1=1:5
        for i=1:length(LsZL{im1})
    for i2=1:length(Dbins)
        if LsDL{im1}(i)<Dbins(i2)
            Zbins{im1,i2}=[Zbins{im1,i2} zgL(i0)*3/fgL(i0)*LsZL{im1}(i)];
            break
        end
    end
end
end
figure
cutoff=1.5;
used=find(Dbins<=cutoff);
ZG=cell(1,5);
for im1=1:5
    for i=1:length(used)
        ZG{im1}=[ZG{im1} Zbins{im1,used(i)}];
        ZGpool{CL(i0),im1}=[ZGpool{CL(i0),im1} Zbins{im1,used(i)}];
    end
end
for im1=1:5
    MGZ(im1)=mean(ZG{im1});
    SEGZ(im1)=sqrt(var(ZG{im1}))/sqrt(length(ZG{im1}));
end
errorbar(MGZ,SEGZ,'Color',C)
hold on
% figure
for im1=1:5
for i=1:length(Zbins)
    MZ(i,im1)=mean(Zbins{im1,i});
    SDZ(i,im1)=sqrt(var(Zbins{im1,i}))/sqrt(length(Zbins{im1,i}));
end
end
% for im1=1:5
% errorbar(MZ(:,im1),SDZ(:,im1))
% hold on
% end
end
% figure
% for pool=1:3
%     if pool==1
%         C=[1 0 0];
%     end
%     if pool==2
%         C=[0 1 0];
%     end
%     if pool==3
%         C=[0 0 1];
%     end
%     for im1=1:5
%         Mp(pool,im1)=mean(ZGpool{pool,im1});
%         SEp(pool,im1)=sqrt(var(ZGpool{pool,im1}))/sqrt(length(ZGpool{pool,im1}));
%     end
%     errorbar(Mp(pool,:),SEp(pool,:),'Color',C)
%     hold on
% end
% legend('Control','Jasp','QQN')

    %%
% R=ceil(rand*length(Lifters));
% trace=indsNO(Lifters(R));
% %trace=12289;
% 
% PlotTraceData(NSTA,trace)