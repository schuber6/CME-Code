% clear all
% 
% load('180820_OsmoPs.mat')
% Osmos20=Osmos;
% load('180821_OsmoPs.mat')
% Osmos21=Osmos;
% 
% folder{5}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 3 min\Traces';
% folder{6}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 10 min\Traces';
% folder21{5}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 3 min 21\Traces';
% folder21{6}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 10 min 21\Traces';
% folder{4}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Traces';
% folder21{4}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont 21\Traces';
% folder{2}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min\Traces';
% folder21{2}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min 21\Traces';
% folder{3}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min\Traces';
% folder21{3}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min 21\Traces';
% folder{1}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont\Traces';
% folder21{1}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont 21\Traces';
% 
% sig=0;
% Indiv=0;
% YL=[0 .05];
% 
% figure
% subplot(2,3,1)
% 
% for i=1:length(folder)
%     files{i}=FindFiles(folder{i},'*FXYCMS*').';
%     found=[];
%     if i==3 || i==6
%         for i2=1:length(files{i})
%             found(i2)=~isempty(strfind(files{i}{i2},'10m'));
%         end
%         files{i}=files{i}(found);
%     end
%     nums=zeros(1,length(files{i}));
%     for i2=1:length(files{i})
%         num=files{i}{i2}(end-20:end-18);
%         nums(i2)=str2num(num);
%         pWater{i}(i2)=Osmos20(nums(i2),2);
%     end
%     
%     Zfold=strcat(folder{i}(1:end-6),'ZStacks');
%     AF=FindFiles(Zfold,'*Areas_RG*');
%     load(AF{1});
%     AreaC{i}=mean(RedArea,2);
%     if ~isempty(found)
%         AreaC{i}=AreaC{i}(found);
%     end
% end
% for i=1:6
%     u66{i}=find(pWater{i}==66);
%     u80{i}=find(pWater{i}==80);
% end
% subplot(2,3,1)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{1},files{4},AreaC{1},AreaC{4},1,sig,3000,YL,Indiv);
% subplot(2,3,2)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{2}(u66{2}),files{5}(u66{5}),AreaC{2}(u66{2}),AreaC{5}(u66{5}),1,sig,3000,YL,Indiv);
% subplot(2,3,3)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{3}(u66{3}),files{6}(u66{6}),AreaC{3}(u66{3}),AreaC{6}(u66{6}),1,sig,3000,YL,Indiv);
% subplot(2,3,5)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{2}(u80{2}),files{5}(u80{5}),AreaC{2}(u80{2}),AreaC{5}(u80{5}),1,sig,3000,YL,Indiv);
% subplot(2,3,6)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{3}(u80{3}),files{6}(u80{6}),AreaC{3}(u80{3}),AreaC{6}(u80{6}),1,sig,3000,YL,Indiv);
% 
% %%
% 
% clear all
% 
% load('180820_OsmoPs.mat')
% Osmos20=Osmos;
% load('180821_OsmoPs.mat')
% Osmos21=Osmos;
% 
% folder{5}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 3 min\Traces';
% folder{6}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 10 min\Traces';
% folder21{5}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 3 min 21\Traces';
% folder21{6}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI 10 min 21\Traces';
% folder{4}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Traces';
% folder21{4}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont 21\Traces';
% folder{2}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min\Traces';
% folder21{2}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min 21\Traces';
% folder{3}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min\Traces';
% folder21{3}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min 21\Traces';
% folder{1}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont\Traces';
% folder21{1}='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont 21\Traces';
% 
% sig=0;
% Indiv=0;
% YL=[0 .05];
% 
% figure
% subplot(2,3,1)
% 
% for i=1:length(folder)
%     files{i}=FindFiles(folder{i},'*FXYCMS*').';
%     if i==3 || i==6
%         found=[];
%         for i2=1:length(files{i})
%             if ~isempty(strfind(files{i}{i2},'10m'))
%                 found=[found i2];
%             end
%         end
%         files{i}=files{i}(found);
%     end
%     nums=zeros(1,length(files{i}));
%     for i2=1:length(files{i})
%         num=files{i}{i2}(end-20:end-18);
%         nums(i2)=str2num(num);
%         pWater{i}(i2)=Osmos20(nums(i2),2);
%     end
%     
%     Zfold=strcat(folder{i}(1:end-6),'ZStacks');
%     AF=FindFiles(Zfold,'*Areas_RG*');
%     load(AF{1});
%     AreaC{i}=mean(RedArea,2);
% end
% for i=1:6
%     u66{i}=find(pWater{i}==66);
%     u80{i}=find(pWater{i}==80);
% end
% 
% for i=1:length(folder21)
%     files21{i}=FindFiles(folder21{i},'*FXYCMS*').';
%     if i==3 || i==6
%         found=[];
%         if ~isempty(strfind(files21{i}{i2},'10m'))
%             found=[found i2];
%         end
%         files21{i}=files21{i}(found);
%     end
%     nums=zeros(1,length(files21{i}));
%     for i2=1:length(files21{i})
%         num=files21{i}{i2}(end-20:end-18);
%         nums(i2)=str2num(num);
%         pWater21{i}(i2)=Osmos21(nums(i2),2);
%     end
%     
%     Zfold=strcat(folder21{i}(1:end-6),'ZStacks');
%     AF=FindFiles(Zfold,'*Areas_RG*');
%     load(AF{1});
%     AreaC21{i}=mean(RedArea,2);
% end
% for i=1:6
%     u6621{i}=find(pWater21{i}==66);
%     u8021{i}=find(pWater21{i}==80);
% end
% for i=1:6
%     u66{i}=[u66{i} (u6621{i}+length(pWater{i}))];
%     u80{i}=[u80{i} (u8021{i}+length(pWater{i}))];
%     files{i}=CombineCells(files{i},files21{i});
%     AreaC{i}=[AreaC{i} ; AreaC21{i}];
% end
% 
% subplot(2,3,1)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{1},files{4},AreaC{1},AreaC{4},1,sig,3000,YL,Indiv);
% subplot(2,3,2)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{2}(u66{2}),files{5}(u66{5}),AreaC{2}(u66{2}),AreaC{5}(u66{5}),1,sig,3000,YL,Indiv);
% subplot(2,3,3)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{3}(u66{3}),files{6}(u66{6}),AreaC{3}(u66{3}),AreaC{6}(u66{6}),1,sig,3000,YL,Indiv);
% subplot(2,3,5)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{2}(u80{2}),files{5}(u80{5}),AreaC{2}(u80{2}),AreaC{5}(u80{5}),1,sig,3000,YL,Indiv);
% subplot(2,3,6)
% [N{1},N{2}]=ConclusionPlot_BySlope(files{3}(u80{3}),files{6}(u80{6}),AreaC{3}(u80{3}),AreaC{6}(u80{6}),1,sig,3000,YL,Indiv);

%%

clear all
load('BothDSIO_Struct_180831.mat')

sig=0;   %1 if you want significance bars
Indiv=0;  %1 if you want all cells plotted individually
YL=[0 .05];  %Ylim for the final plots

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80);

[FileWTpre,areaWTpre]=IndexStruct(DSIOfiles,WTpre);  %Extract files and areas into a cell and vector
[FileSIpre,areaSIpre]=IndexStruct(DSIOfiles,SIpre);
[FileWT3m66,areaWT3m66]=IndexStruct(DSIOfiles,WT3m66);
[FileSI3m66,areaSI3m66]=IndexStruct(DSIOfiles,SI3m66);
[FileWT3m80,areaWT3m80]=IndexStruct(DSIOfiles,WT3m80);
[FileSI3m80,areaSI3m80]=IndexStruct(DSIOfiles,SI3m80);
[FileWT10m66,areaWT10m66]=IndexStruct(DSIOfiles,WT10m66);
[FileSI10m66,areaSI10m66]=IndexStruct(DSIOfiles,SI10m66);
[FileWT10m80,areaWT10m80]=IndexStruct(DSIOfiles,WT10m80);
[FileSI10m80,areaSI10m80]=IndexStruct(DSIOfiles,SI10m80);

figure
subplot(2,3,1)
[N{1},N{2}]=ConclusionPlot_BySlope(FileWTpre,FileSIpre,areaWTpre,areaSIpre,1,sig,3000,YL,Indiv);
subplot(2,3,2)
[N{1},N{2}]=ConclusionPlot_BySlope(FileWT3m66,FileSI3m66,areaWT3m66,areaSI3m66,1,sig,3000,YL,Indiv);
subplot(2,3,3)
[N{1},N{2}]=ConclusionPlot_BySlope(FileWT10m66,FileSI10m66,areaWT10m66,areaSI10m66,1,sig,3000,YL,Indiv);
subplot(2,3,5)
[N{1},N{2}]=ConclusionPlot_BySlope(FileWT3m80,FileSI3m80,areaWT3m80,areaSI3m80,1,sig,3000,YL,Indiv);
subplot(2,3,6)
[N{1},N{2}]=ConclusionPlot_BySlope(FileWT10m80,FileSI10m80,areaWT10m80,areaSI10m80,1,sig,3000,YL,Indiv);

%%
clear all
%load('BothDSIO_Struct_180831.mat')
load('BothDSIO_Struct_181024_EndoFilter_30s.mat')

YL=[0 .45];
ClathMin=.5*10^4;
sig=0;
ylab='Internalizations/um^2/5 min';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

PreC={[DSIOfiles(WTpre).ConcsPerArea],[DSIOfiles(SIpre).ConcsPerArea]};
P3m66C={[DSIOfiles(WT3m66).ConcsPerArea],[DSIOfiles(SI3m66).ConcsPerArea]};
P10m66C={[DSIOfiles(WT10m66).ConcsPerArea],[DSIOfiles(SI10m66).ConcsPerArea]};
P3m80C={[DSIOfiles(WT3m80).ConcsPerArea],[DSIOfiles(SI3m80).ConcsPerArea]};
P10m80C={[DSIOfiles(WT10m80).ConcsPerArea],[DSIOfiles(SI10m80).ConcsPerArea]};

figure
subplot(2,3,1)
BoxPlotCell(PreC,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(1)]=kstest2(PreC{1},PreC{2});
    if p(1)>.05
       % p(1)=nan;
    end
    sigstar([1 2],p(1))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(2)]=kstest2(P3m66C{1},P3m66C{2});
    if p(2)>.05
       % p(2)=nan; 
    end
    sigstar([1 2],p(2))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(3)]=kstest2(P10m66C{1},P10m66C{2});
    if p(3)>.05
      %  p(3)=nan;
    end
    sigstar([1 2],p(3))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(4)]=kstest2(P3m80C{1},P3m80C{2});
    if p(4)>.05
       % p(4)=nan;
    end
    sigstar([1 2],p(4))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(5)]=kstest2(P10m80C{1},P10m80C{2});
    if p(5)>.05
       % p(5)=nan;
    end
    sigstar([1 2],p(5))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)

%%  Compare the 2 days of osmoshock

clear all
%load('BothDSIO_DSIOFilesStruct_181119_EndoFilter.mat')
%load('BothDSIO_Struct_181024_EndoFilter_30s.mat')
load('BothDSIO_Struct_180831.mat')
YL=[0 .2];
ClathMin=.5*10^4;
sig=0;
ylab='Internalizations/um^2/5 min';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.Day]==0 & [DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.Day]==0 & [DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);
SIpre2=find([DSIOfiles.Day]>=1 & [DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre2=find([DSIOfiles.Day]>=1 & [DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.Day]==0 & [DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.Day]==0 & [DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.Day]>=1 & [DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.Day]>=1 & [DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.Day]==0 & [DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.Day]==0 & [DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.Day]>=1 & [DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.Day]>=1 & [DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

PreC={[DSIOfiles(WTpre).ConcsPerArea],[DSIOfiles(SIpre).ConcsPerArea]};
PreC2={[DSIOfiles(WTpre2).ConcsPerArea],[DSIOfiles(SIpre2).ConcsPerArea]};
P3m66C={[DSIOfiles(WT3m66).ConcsPerArea],[DSIOfiles(SI3m66).ConcsPerArea]};
P10m66C={[DSIOfiles(WT10m66).ConcsPerArea],[DSIOfiles(SI10m66).ConcsPerArea]};
P3m80C={[DSIOfiles(WT3m80).ConcsPerArea],[DSIOfiles(SI3m80).ConcsPerArea]};
P10m80C={[DSIOfiles(WT10m80).ConcsPerArea],[DSIOfiles(SI10m80).ConcsPerArea]};

figure
% subplot(2,3,1)
% BoxPlotCell(PreC,@notBoxPlot)
% ylim(YL)
% ylabel(ylab)
% xticklabels(L)
% subplot(2,3,4)
% BoxPlotCell(PreC2,@notBoxPlot)
% if sig
%     %[~,p]=ttest2(Ncwt,Ncsi);
%     [~,p(1)]=kstest2(PreC{1},PreC{2});
%     if p(1)>.05
%        % p(1)=nan;
%     end
%     sigstar([1 2],p(1))
% end
% ylim(YL)
% ylabel(ylab)
% xticklabels(L)
subplot(2,2,1)
BoxPlotCell(P3m66C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(2)]=kstest2(P3m66C{1},P3m66C{2});
    if p(2)>.05
       % p(2)=nan; 
    end
    sigstar([1 2],p(2))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,2,2)
BoxPlotCell(P10m66C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(3)]=kstest2(P10m66C{1},P10m66C{2});
    if p(3)>.05
      %  p(3)=nan;
    end
    sigstar([1 2],p(3))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,2,3)
BoxPlotCell(P3m80C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(4)]=kstest2(P3m80C{1},P3m80C{2});
    if p(4)>.05
       % p(4)=nan;
    end
    sigstar([1 2],p(4))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,2,4)
BoxPlotCell(P10m80C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(5)]=kstest2(P10m80C{1},P10m80C{2});
    if p(5)>.05
       % p(5)=nan;
    end
    sigstar([1 2],p(5))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)

%%  Look at results from day 3
% clear all
% %load('BothDSIO_Struct_180831.mat')
% load('BothDSIO_DSIOFilesStruct_181119_EndoFilter.mat')
% YL=[0 .45];
% ClathMin=.5*10^4;
% sig=0;
% ylab='Internalizations/um^2/5 min';
% L={'Control','CALM siRNA'};
% 
% SIpre=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
% WTpre=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI3m66=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
% WT3m66=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% SI3m80=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% WT3m80=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI10m66=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
% WT10m66=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% SI10m80=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% WT10m80=find([DSIOfiles.Day]~=3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SIpred3=find([DSIOfiles.Day]==3 & [DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
% WTpred3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI3m66d3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
% WT3m66d3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% %SI3m80=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% %WT3m80=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI10m66d3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
% WT10m66d3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% %SI10m80=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% %WT10m80=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% B66(1,2)=sum([DSIOfiles(SIpre).NConclusions])/sum([DSIOfiles(SIpre).area]);
% B66(1,1)=sum([DSIOfiles(WTpre).NConclusions])/sum([DSIOfiles(WTpre).area]);
% B66(2,2)=sum([DSIOfiles(SI3m66).NConclusions])/sum([DSIOfiles(SI3m66).area]);
% B66(2,1)=sum([DSIOfiles(WT3m66).NConclusions])/sum([DSIOfiles(WT3m66).area]);
% B66(3,2)=sum([DSIOfiles(SI10m66).NConclusions])/sum([DSIOfiles(SI10m66).area]);
% B66(3,1)=sum([DSIOfiles(WT10m66).NConclusions])/sum([DSIOfiles(WT10m66).area]);
% 
% B66d3(1,2)=sum([DSIOfiles(SIpred3).NConclusions])/sum([DSIOfiles(SIpred3).area]);
% B66d3(1,1)=sum([DSIOfiles(WTpred3).NConclusions])/sum([DSIOfiles(WTpred3).area]);
% B66d3(2,2)=sum([DSIOfiles(SI3m66d3).NConclusions])/sum([DSIOfiles(SI3m66d3).area]);
% B66d3(2,1)=sum([DSIOfiles(WT3m66d3).NConclusions])/sum([DSIOfiles(WT3m66d3).area]);
% B66d3(3,2)=sum([DSIOfiles(SI10m66d3).NConclusions])/sum([DSIOfiles(SI10m66d3).area]);
% B66d3(3,1)=sum([DSIOfiles(WT10m66d3).NConclusions])/sum([DSIOfiles(WT10m66d3).area]);
% 
% E66(1,2)=sqrt(var([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
% E66(1,1)=sqrt(var([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
% E66(2,2)=sqrt(var([DSIOfiles(SI3m66).NConclusions]./[DSIOfiles(SI3m66).area]))/sqrt(length(SI3m66));
% E66(2,1)=sqrt(var([DSIOfiles(WT3m66).NConclusions]./[DSIOfiles(WT3m66).area]))/sqrt(length(WT3m66));
% E66(3,2)=sqrt(var([DSIOfiles(SI10m66).NConclusions]./[DSIOfiles(SI10m66).area]))/sqrt(length(SI10m66));
% E66(3,1)=sqrt(var([DSIOfiles(WT10m66).NConclusions]./[DSIOfiles(WT10m66).area]))/sqrt(length(WT10m66));
% 
% E66d3(1,2)=sqrt(var([DSIOfiles(SIpred3).NConclusions]./[DSIOfiles(SIpred3).area]))/sqrt(length(SIpred3));
% E66d3(1,1)=sqrt(var([DSIOfiles(WTpred3).NConclusions]./[DSIOfiles(WTpred3).area]))/sqrt(length(WTpred3));
% E66d3(2,2)=sqrt(var([DSIOfiles(SI3m66d3).NConclusions]./[DSIOfiles(SI3m66d3).area]))/sqrt(length(SI3m66d3));
% E66d3(2,1)=sqrt(var([DSIOfiles(WT3m66d3).NConclusions]./[DSIOfiles(WT3m66d3).area]))/sqrt(length(WT3m66d3));
% E66d3(3,2)=sqrt(var([DSIOfiles(SI10m66d3).NConclusions]./[DSIOfiles(SI10m66d3).area]))/sqrt(length(SI10m66d3));
% E66d3(3,1)=sqrt(var([DSIOfiles(WT10m66d3).NConclusions]./[DSIOfiles(WT10m66d3).area]))/sqrt(length(WT10m66d3));
% 
% figure
% subplot(1,2,1)
% b=bar(B66/5,'FaceAlpha',.75);
% hold on
% b(1).FaceColor = 'c';
% b(2).FaceColor = 'r';
% errorbar([1 2 3]-.15,B66(:,1)/5,E66(:,1)/5,'.','Color','k')
% errorbar([1 2 3]+.15,B66(:,2)/5,E66(:,2)/5,'.','Color','k')
% legend('Control Cells','CALM siRNA Cells')
% ylabel('Internalizations/um^2/min')
% xticks(1:3)
% xticklabels({'Before','3-8 min After','10-15 min After'})
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',16)
% title('66% Osmotic Shock','FontSize',20)
% 
% subplot(1,2,2)
% b=bar(B66d3/5,'FaceAlpha',.75);
% hold on
% b(1).FaceColor = 'c';
% b(2).FaceColor = 'r';
% errorbar([1 2 3]-.15,B66d3(:,1)/5,E66d3(:,1)/5,'.','Color','k')
% errorbar([1 2 3]+.15,B66d3(:,2)/5,E66d3(:,2)/5,'.','Color','k')
% legend('Control Cells','CALM siRNA Cells')
% ylabel('Internalizations/um^2/min')
% xticks(1:3)
% xticklabels({'Before','3-8 min After','10-15 min After'})
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',16)
% title('66% Osmotic Shock','FontSize',20)

%%  Look at intensities from day 3
% clear all
% %load('BothDSIO_Struct_180831.mat')
% load('BothDSIO_DSIOFilesStruct_181119_EndoFilter.mat')
% YL=[0 .45];
% ClathMin=0*10^4;
% sig=0;
% ylab='Internalizations/um^2/5 min';
% L={'Control','CALM siRNA'};
% 
% SIpre=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
% WTpre=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI3m66=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
% WT3m66=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% SI3m80=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% WT3m80=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI10m66=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
% WT10m66=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% SI10m80=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% WT10m80=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SIpred3=find([DSIOfiles.Day]==3 & [DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
% WTpred3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI3m66d3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
% WT3m66d3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% %SI3m80=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% %WT3m80=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI10m66d3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
% WT10m66d3=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% %SI10m80=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% %WT10m80=find([DSIOfiles.Day]==3 &[DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% B66(1,2)=sum([DSIOfiles(SIpre).MedianCALM]);
% B66(1,1)=sum([DSIOfiles(WTpre).MedianCALM]);
% B66(2,2)=sum([DSIOfiles(SI3m66).MedianCALM]);
% B66(2,1)=sum([DSIOfiles(WT3m66).MedianCALM]);
% B66(3,2)=sum([DSIOfiles(SI10m66).MedianCALM]);
% B66(3,1)=sum([DSIOfiles(WT10m66).MedianCALM]);
% 
% B66d3(1,2)=sum([DSIOfiles(SIpred3).MedianCALM]);
% B66d3(1,1)=sum([DSIOfiles(WTpred3).MedianCALM]);
% B66d3(2,2)=sum([DSIOfiles(SI3m66d3).MedianCALM]);
% B66d3(2,1)=sum([DSIOfiles(WT3m66d3).MedianCALM]);
% B66d3(3,2)=sum([DSIOfiles(SI10m66d3).MedianCALM]);
% B66d3(3,1)=sum([DSIOfiles(WT10m66d3).MedianCALM]);
% 
% E66(1,2)=sqrt(var([DSIOfiles(SIpre).MedianCALM]))/sqrt(length(SIpre));
% E66(1,1)=sqrt(var([DSIOfiles(WTpre).MedianCALM]))/sqrt(length(WTpre));
% E66(2,2)=sqrt(var([DSIOfiles(SI3m66).MedianCALM]))/sqrt(length(SI3m66));
% E66(2,1)=sqrt(var([DSIOfiles(WT3m66).MedianCALM]))/sqrt(length(WT3m66));
% E66(3,2)=sqrt(var([DSIOfiles(SI10m66).MedianCALM]))/sqrt(length(SI10m66));
% E66(3,1)=sqrt(var([DSIOfiles(WT10m66).MedianCALM]))/sqrt(length(WT10m66));
% 
% E66d3(1,2)=sqrt(var([DSIOfiles(SIpred3).MedianCALM]))/sqrt(length(SIpred3));
% E66d3(1,1)=sqrt(var([DSIOfiles(WTpred3).MedianCALM]))/sqrt(length(WTpred3));
% E66d3(2,2)=sqrt(var([DSIOfiles(SI3m66d3).MedianCALM]))/sqrt(length(SI3m66d3));
% E66d3(2,1)=sqrt(var([DSIOfiles(WT3m66d3).MedianCALM]))/sqrt(length(WT3m66d3));
% E66d3(3,2)=sqrt(var([DSIOfiles(SI10m66d3).MedianCALM]))/sqrt(length(SI10m66d3));
% E66d3(3,1)=sqrt(var([DSIOfiles(WT10m66d3).MedianCALM]))/sqrt(length(WT10m66d3));
% 
% figure
% subplot(1,2,1)
% b=bar(B66/5,'FaceAlpha',.75);
% hold on
% b(1).FaceColor = 'c';
% b(2).FaceColor = 'r';
% errorbar([1 2 3]-.15,B66(:,1)/5,E66(:,1)/5,'.','Color','k')
% errorbar([1 2 3]+.15,B66(:,2)/5,E66(:,2)/5,'.','Color','k')
% legend('Control Cells','CALM siRNA Cells')
% ylabel('Median CALM Intensity')
% xticks(1:3)
% xticklabels({'Before','3-8 min After','10-15 min After'})
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',16)
% title('66% Osmotic Shock (Old Data)','FontSize',20)
% 
% subplot(1,2,2)
% b=bar(B66d3/5,'FaceAlpha',.75);
% hold on
% b(1).FaceColor = 'c';
% b(2).FaceColor = 'r';
% errorbar([1 2 3]-.15,B66d3(:,1)/5,E66d3(:,1)/5,'.','Color','k')
% errorbar([1 2 3]+.15,B66d3(:,2)/5,E66d3(:,2)/5,'.','Color','k')
% legend('Control Cells','CALM siRNA Cells')
% ylabel('Median CALM Intensity')
% xticks(1:3)
% xticklabels({'Before','3-8 min After','10-15 min After'})
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',16)
% title('66% Osmotic Shock (New Data)','FontSize',20)
% ylim([0 25000])
%%  Internalizations barplot
% clear all
load('BothDSIO_DSIOFilesStruct_181119_EndoFilter.mat')

B80(1,2)=sum([DSIOfiles(SIpre).NConclusions])/sum([DSIOfiles(SIpre).area]);
B80(1,1)=sum([DSIOfiles(WTpre).NConclusions])/sum([DSIOfiles(WTpre).area]);
B80(2,2)=sum([DSIOfiles(SI3m80).NConclusions])/sum([DSIOfiles(SI3m80).area]);
B80(2,1)=sum([DSIOfiles(WT3m80).NConclusions])/sum([DSIOfiles(WT3m80).area]);
B80(3,2)=sum([DSIOfiles(SI10m80).NConclusions])/sum([DSIOfiles(SI10m80).area]);
B80(3,1)=sum([DSIOfiles(WT10m80).NConclusions])/sum([DSIOfiles(WT10m80).area]);

S80=[length(SIpre) length(WTpre) length(SI3m80) length(WT3m80) length(SI10m80) length(WT10m80)];
S66=[length(SIpre) length(WTpre) length(SI3m66) length(WT3m66) length(SI10m66) length(WT10m66)];


E80(1,2)=sqrt(var([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
E80(1,1)=sqrt(var([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
E80(2,2)=sqrt(var([DSIOfiles(SI3m80).NConclusions]./[DSIOfiles(SI3m80).area]))/sqrt(length(SI3m80));
E80(2,1)=sqrt(var([DSIOfiles(WT3m80).NConclusions]./[DSIOfiles(WT3m80).area]))/sqrt(length(WT3m80));
E80(3,2)=sqrt(var([DSIOfiles(SI10m80).NConclusions]./[DSIOfiles(SI10m80).area]))/sqrt(length(SI10m80));
E80(3,1)=sqrt(var([DSIOfiles(WT10m80).NConclusions]./[DSIOfiles(WT10m80).area]))/sqrt(length(WT10m80));

figure
subplot(1,2,1)
b=bar(B80/5,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar([1 2 3]-.15,B80(:,1)/5,E80(:,1)/5,'.','Color','k')
errorbar([1 2 3]+.15,B80(:,2)/5,E80(:,2)/5,'.','Color','k')

legend('Control Cells','CALM siRNA Cells')
xticks(1:3)
xticklabels({'Before','3-8 min After','10-15 min After'})
ylabel('Internalizations/um^2/min')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('80% Osmotic Shock','FontSize',20)


B66(1,2)=sum([DSIOfiles(SIpre).NConclusions])/sum([DSIOfiles(SIpre).area]);
B66(1,1)=sum([DSIOfiles(WTpre).NConclusions])/sum([DSIOfiles(WTpre).area]);
B66(2,2)=sum([DSIOfiles(SI3m66).NConclusions])/sum([DSIOfiles(SI3m66).area]);
B66(2,1)=sum([DSIOfiles(WT3m66).NConclusions])/sum([DSIOfiles(WT3m66).area]);
B66(3,2)=sum([DSIOfiles(SI10m66).NConclusions])/sum([DSIOfiles(SI10m66).area]);
B66(3,1)=sum([DSIOfiles(WT10m66).NConclusions])/sum([DSIOfiles(WT10m66).area]);

E66(1,2)=sqrt(var([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
E66(1,1)=sqrt(var([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
E66(2,2)=sqrt(var([DSIOfiles(SI3m66).NConclusions]./[DSIOfiles(SI3m66).area]))/sqrt(length(SI3m66));
E66(2,1)=sqrt(var([DSIOfiles(WT3m66).NConclusions]./[DSIOfiles(WT3m66).area]))/sqrt(length(WT3m66));
E66(3,2)=sqrt(var([DSIOfiles(SI10m66).NConclusions]./[DSIOfiles(SI10m66).area]))/sqrt(length(SI10m66));
E66(3,1)=sqrt(var([DSIOfiles(WT10m66).NConclusions]./[DSIOfiles(WT10m66).area]))/sqrt(length(WT10m66));

subplot(1,2,2)
b=bar(B66/5,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar([1 2 3]-.15,B66(:,1)/5,E66(:,1)/5,'.','Color','k')
errorbar([1 2 3]+.15,B66(:,2)/5,E66(:,2)/5,'.','Color','k')
legend('Control Cells','CALM siRNA Cells')
ylabel('Internalizations/um^2/min')
xticks(1:3)
xticklabels({'Before','3-8 min After','10-15 min After'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('66% Osmotic Shock','FontSize',20)

%%  Same with both times of 66% pooled
clear all
load('BothDSIO_Struct_180914_LTs.mat')
YL=[0 .07];
ClathMin=.5*10^4;
sig=1;
BP=1;
ylab='Internalizations/um^2/min';
L={'Control','CALM siRNA'};

if BP==1
    FN=@boxplot;
else
    FN=@notBoxPlot;
end

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]>=1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]>=1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

PreC={[DSIOfiles(WTpre).ConcsPerArea]/5,[DSIOfiles(SIpre).ConcsPerArea]/5};
P3m66C={[DSIOfiles(WT3m66).ConcsPerArea]/5,[DSIOfiles(SI3m66).ConcsPerArea]/5};
P10m66C={[DSIOfiles(WT10m66).ConcsPerArea]/5,[DSIOfiles(SI10m66).ConcsPerArea]/5};
P3m80C={[DSIOfiles(WT3m80).ConcsPerArea]/5,[DSIOfiles(SI3m80).ConcsPerArea]/5};
P10m80C={[DSIOfiles(WT10m80).ConcsPerArea]/5,[DSIOfiles(SI10m80).ConcsPerArea]/5};

figure
subplot(2,2,1)
BoxPlotCell(PreC,FN)
ylim(YL)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(1)]=ttest2(PreC{1},PreC{2});
    if p(1)>.05
       sigstar([1 2],nan)
    else
    sigstar([1 2],p(1))
    end
end

ylabel(ylab)
xticklabels(L)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
subplot(2,2,2)
BoxPlotCell(P3m66C,FN)
ylim(YL)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(2)]=ttest2(P3m66C{1},P3m66C{2});
    if p(2)>.05
       sigstar([1 2],nan)
    else
    sigstar([1 2],p(2))
    end
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)

subplot(2,2,4)
BoxPlotCell(P3m80C,FN)
ylim(YL)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(4)]=ttest2(P3m80C{1},P3m80C{2});
    if p(4)>.05
       sigstar([1 2],nan)
    else
    sigstar([1 2],p(4))
    end
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)


%%


clear all
load('BothDSIO_DSIOFilesStruct.mat')
YL=[0 .3];
ClathMin=10^4;
ylab='Internalizations/um^2/5 min';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

[~,~,~,~,slopeWT{1},slopeSI{1}]=JoshSlopeHists_SIRNA_NoPlot({DSIOfiles(WTpre).file},{DSIOfiles(SIpre).file});
[~,~,~,~,slopeWT{2},slopeSI{2}]=JoshSlopeHists_SIRNA_NoPlot({DSIOfiles(WT3m66).file},{DSIOfiles(SI3m66).file});
[~,~,~,~,slopeWT{3},slopeSI{3}]=JoshSlopeHists_SIRNA_NoPlot({DSIOfiles(WT10m66).file},{DSIOfiles(SI10m66).file});
[~,~,~,~,slopeWT{4},slopeSI{4}]=JoshSlopeHists_SIRNA_NoPlot({DSIOfiles(WT3m80).file},{DSIOfiles(SI3m80).file});
[~,~,~,~,slopeWT{5},slopeSI{5}]=JoshSlopeHists_SIRNA_NoPlot({DSIOfiles(WT10m80).file},{DSIOfiles(SI10m80).file});

%%

V=-.08:.002:.08;
used=[2:40 42:80];
for i=1:5
    Hw{i}=hist(slopeWT{i},V);
    Hw{i}=Hw{i}/sum(Hw{i});
    Hs{i}=hist(slopeSI{i},V);
    Hs{i}=Hs{i}/sum(Hs{i});
end
figure
subplot(2,3,1)
plot(V(used),Hw{1}(used),'b')
hold on
plot(V(used),Hs{1}(used),'r')
subplot(2,3,2)
plot(V(used),Hw{2}(used),'b')
hold on
plot(V(used),Hs{2}(used),'r')
subplot(2,3,3)
plot(V(used),Hw{3}(used),'b')
hold on
plot(V(used),Hs{3}(used),'r')
subplot(2,3,5)
plot(V(used),Hw{4}(used),'b')
hold on
plot(V(used),Hs{4}(used),'r')
subplot(2,3,6)
plot(V(used),Hw{5}(used),'b')
hold on
plot(V(used),Hs{5}(used),'r')

%%
clear all
load('BothDSIO_DSIOFilesStruct.mat')
YL=[0 .03];
ClathMin=0;
ylab='Growth Rate Standard Deviation';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

PreC={[DSIOfiles(WTpre).GRSDclath],[DSIOfiles(SIpre).GRSDclath]};
P3m66C={[DSIOfiles(WT3m66).GRSDclath],[DSIOfiles(SI3m66).GRSDclath]};
P10m66C={[DSIOfiles(WT10m66).GRSDclath],[DSIOfiles(SI10m66).GRSDclath]};
P3m80C={[DSIOfiles(WT3m80).GRSDclath],[DSIOfiles(SI3m80).GRSDclath]};
P10m80C={[DSIOfiles(WT10m80).GRSDclath],[DSIOfiles(SI10m80).GRSDclath]};

figure
subplot(2,3,1)
BoxPlotCell(PreC,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)

%%
clear all
load('BothDSIO_DSIOFilesStruct.mat')
YL=[0 .5];
ClathMin=0;
ylab='Concurrent Spots/um^2';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

PreC={[DSIOfiles(WTpre).SpotsPerFramePerArea],[DSIOfiles(SIpre).SpotsPerFramePerArea]};
P3m66C={[DSIOfiles(WT3m66).SpotsPerFramePerArea],[DSIOfiles(SI3m66).SpotsPerFramePerArea]};
P10m66C={[DSIOfiles(WT10m66).SpotsPerFramePerArea],[DSIOfiles(SI10m66).SpotsPerFramePerArea]};
P3m80C={[DSIOfiles(WT3m80).SpotsPerFramePerArea],[DSIOfiles(SI3m80).SpotsPerFramePerArea]};
P10m80C={[DSIOfiles(WT10m80).SpotsPerFramePerArea],[DSIOfiles(SI10m80).SpotsPerFramePerArea]};

figure
subplot(2,3,1)
BoxPlotCell(PreC,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
%%

% clear all
% load('BothDSIO_Struct_180914_LTs.mat')
YL=[0 10*10^4];
ClathMin=.5*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SIpreMS=[];
for i=1:length(SIpre)
    SIpreMS=[SIpreMS MS{SIpre(i)}];
end
WTpreMS=[];
for i=1:length(WTpre)
    WTpreMS=[WTpreMS MS{WTpre(i)}];
end

SI3m66MS=[];
for i=1:length(SI3m66)
    SI3m66MS=[SI3m66MS MS{SI3m66(i)}];
end
WT3m66MS=[];
for i=1:length(WT3m66)
    WT3m66MS=[WT3m66MS MS{WT3m66(i)}];
end

SI10m66MS=[];
for i=1:length(SI10m66)
    SI10m66MS=[SI10m66MS MS{SI10m66(i)}];
end
WT10m66MS=[];
for i=1:length(WT10m66)
    WT10m66MS=[WT10m66MS MS{WT10m66(i)}];
end

SI3m80MS=[];
for i=1:length(SI3m80)
    SI3m80MS=[SI3m80MS MS{SI3m80(i)}];
end
WT3m80MS=[];
for i=1:length(WT3m80)
    WT3m80MS=[WT3m80MS MS{WT3m80(i)}];
end

SI10m80MS=[];
for i=1:length(SI10m80)
    SI10m80MS=[SI10m80MS MS{SI10m80(i)}];
end
WT10m80MS=[];
for i=1:length(WT10m80)
    WT10m80MS=[WT10m80MS MS{WT10m80(i)}];
end

PreC={WTpreMS,SIpreMS};
P3m66C={WT3m66MS,SI3m66MS};
P10m66C={WT10m66MS,SI10m66MS};
P3m80C={WT3m80MS,SI3m80MS};
P10m80C={WT10m80MS,SI10m80MS};

figure
subplot(2,3,1)
BoxPlotCell(PreC,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)

notbox=1;
figure
if notbox
BoxPlotCell({PreC{2},P3m66C{2},P10m66C{2}},@notBoxPlot)
title('siRNA cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{2},P3m80C{2},P10m80C{2}},@notBoxPlot)
title('siRNA cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{1},P3m66C{1},P10m66C{1}},@notBoxPlot)
title('Control cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{1},P3m80C{1},P10m80C{1}},@notBoxPlot)
title('Control cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
else
BoxPlotCell({PreC{2},P3m66C{2},P10m66C{2}})
title('siRNA cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{2},P3m80C{2},P10m80C{2}})
title('siRNA cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})

figure
BoxPlotCell({PreC{1},P3m66C{1},P10m66C{1}})
title('Control cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{1},P3m80C{1},P10m80C{1}})
title('Control cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
end
%%

clear all
load('BothDSIO_Struct_180920_EndoFilter_30s.mat')
YL=[0 10*10^4];
ClathMin=.5*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SIpreMS=[];
for i=1:length(SIpre)
    SIpreMS=[SIpreMS MS_EF{SIpre(i)}];
end
WTpreMS=[];
for i=1:length(WTpre)
    WTpreMS=[WTpreMS MS_EF{WTpre(i)}];
end

SI3m66MS=[];
for i=1:length(SI3m66)
    SI3m66MS=[SI3m66MS MS_EF{SI3m66(i)}];
end
WT3m66MS=[];
for i=1:length(WT3m66)
    WT3m66MS=[WT3m66MS MS_EF{WT3m66(i)}];
end

SI10m66MS=[];
for i=1:length(SI10m66)
    SI10m66MS=[SI10m66MS MS_EF{SI10m66(i)}];
end
WT10m66MS=[];
for i=1:length(WT10m66)
    WT10m66MS=[WT10m66MS MS_EF{WT10m66(i)}];
end

SI3m80MS=[];
for i=1:length(SI3m80)
    SI3m80MS=[SI3m80MS MS_EF{SI3m80(i)}];
end
WT3m80MS=[];
for i=1:length(WT3m80)
    WT3m80MS=[WT3m80MS MS_EF{WT3m80(i)}];
end

SI10m80MS=[];
for i=1:length(SI10m80)
    SI10m80MS=[SI10m80MS MS_EF{SI10m80(i)}];
end
WT10m80MS=[];
for i=1:length(WT10m80)
    WT10m80MS=[WT10m80MS MS_EF{WT10m80(i)}];
end

PreC={WTpreMS,SIpreMS};
P3m66C={WT3m66MS,SI3m66MS};
P10m66C={WT10m66MS,SI10m66MS};
P3m80C={WT3m80MS,SI3m80MS};
P10m80C={WT10m80MS,SI10m80MS};

figure
subplot(2,3,1)
BoxPlotCell(PreC,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)

notbox=1;
figure
if notbox
BoxPlotCell({PreC{2},P3m66C{2},P10m66C{2}},@notBoxPlot)
title('siRNA cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{2},P3m80C{2},P10m80C{2}},@notBoxPlot)
title('siRNA cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{1},P3m66C{1},P10m66C{1}},@notBoxPlot)
title('Control cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{1},P3m80C{1},P10m80C{1}},@notBoxPlot)
title('Control cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
else
BoxPlotCell({PreC{2},P3m66C{2},P10m66C{2}})
title('siRNA cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{2},P3m80C{2},P10m80C{2}})
title('siRNA cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})

figure
BoxPlotCell({PreC{1},P3m66C{1},P10m66C{1}})
title('Control cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{1},P3m80C{1},P10m80C{1}})
title('Control cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
end

%%  66% figure in the style of Ema's dynamin one
bins=40;
PRCs=[.25 .50 .75];
figure
subplot(2,3,1)

[H,CBins]=hist(PreC{1}/10^4,bins);
bar(CBins,H/sum(H)*100)
title('      Control Cells \newline Before Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,4)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
Xs=CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

subplot(2,3,2)

[H,CBins]=hist(P3m66C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title('                 Control Cells \newline 3 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,5)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_XLines(CBins,CDF,Xs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

subplot(2,3,3)

[H,CBins]=hist(P10m66C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title('                 Control Cells \newline 10 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,6)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_XLines(CBins,CDF,Xs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)


figure
subplot(2,3,1)
[H]=hist(PreC{2}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title(' CALM siRNA Cells \newline Before Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,4)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
Xs=CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

subplot(2,3,2)

[H,CBins]=hist(P3m66C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title('             CALM siRNA Cells \newline 3 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,5)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_XLines(CBins,CDF,Xs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

subplot(2,3,3)

[H,CBins]=hist(P10m66C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title('             CALM siRNA Cells \newline 10 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,6)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_XLines(CBins,CDF,Xs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

%%  80% figure in the style of Ema's dynamin one
bins=40;
PRCs=[.25 .50 .75];
figure
subplot(2,3,1)

[H,CBins]=hist(PreC{1}/10^4,bins);
bar(CBins,H/sum(H)*100)
title('      Control Cells \newline Before Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,4)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
Xs=CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

subplot(2,3,2)

[H,CBins]=hist(P3m80C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title('                 Control Cells \newline 3 minutes after 80% Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,5)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_XLines(CBins,CDF,Xs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

subplot(2,3,3)

[H,CBins]=hist(P10m80C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title('                 Control Cells \newline 10 minutes after 80% Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,6)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_XLines(CBins,CDF,Xs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)


figure
subplot(2,3,1)
[H]=hist(PreC{2}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title(' CALM siRNA Cells \newline Before Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,4)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
Xs=CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

subplot(2,3,2)

[H,CBins]=hist(P3m80C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title('             CALM siRNA Cells \newline 3 minutes after 80% Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,5)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_XLines(CBins,CDF,Xs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

subplot(2,3,3)

[H,CBins]=hist(P10m80C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100)
title('             CALM siRNA Cells \newline 10 minutes after 80% Osmoshock')
xlim([0 max(CBins)])
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(2,3,6)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_XLines(CBins,CDF,Xs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(0:7)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)

%%  66+80% combined figure in the style of Ema's dynamin one
bins=40;
FS=12;
YL=[0 25];
YT=[0 5 10 15 20];
XT=0:5;
XL=[0 5];
PRCs=[.25 .50 .75];
figure


clear h
Mc=median(PreC{1}/10^4);
[H,CBins]=hist(PreC{1}/10^4,bins);
subplot(2,5,6)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
Xs=CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
line([Xs(2) Xs(2)],[0 .5],'Color','r','LineStyle','--')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,1)
bar(CBins,H/sum(H)*100,1)

title('      Control Cells \newline Before Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
legend(strcat('N=',num2str(sum(H))))
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)


subplot(2,5,2)

[H,CBins]=hist(P3m66C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('                 Control Cells \newline 3 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
legend(strcat('N=',num2str(sum(H))))
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,7)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

subplot(2,5,3)

[H,CBins]=hist(P10m66C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('                 Control Cells \newline 10 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
legend(strcat('N=',num2str(sum(H))))
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,8)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

subplot(2,5,4)

[H,CBins]=hist(P3m80C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('                 Control Cells \newline 3 minutes after 80% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,9)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

subplot(2,5,5)

[H,CBins]=hist(P10m80C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('                 Control Cells \newline 10 minutes after 80% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,10)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)



figure
[H]=hist(PreC{2}/10^4,CBins);
subplot(2,5,6)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
Xs=CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
line([Xs(2) Xs(2)],[0 .5],'Color','r','LineStyle','--')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,1)
bar(CBins,H/sum(H)*100,1)
title(' CALM siRNA Cells \newline Before Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)


subplot(2,5,2)

[H,CBins]=hist(P3m66C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('             CALM siRNA Cells \newline 3 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,7)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

subplot(2,5,3)

[H,CBins]=hist(P10m66C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('             CALM siRNA Cells \newline 10 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,8)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

subplot(2,5,4)

[H,CBins]=hist(P3m80C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('             CALM siRNA Cells \newline 3 minutes after 80% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,9)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

subplot(2,5,5)

[H,CBins]=hist(P10m80C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('             CALM siRNA Cells \newline 10 minutes after 80% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,5,10)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

%%  66+80% combined figure in the style of Ema's dynamin one
bins=40;
FS=12;
YL=[0 17];
YT=[0 5 10 15];
XT=0:5;
XL=[0 5];
PRCs=[.25 .50 .75];
figure

[H,CBins]=hist(PreC{1}/10^4,bins);
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
Xs=CDF_PrctileLines(CBins,CDF,PRCs,0);

EmaSubFig(PreC{1},CBins,1,Xs(2),'      Control Cells \newline Before Osmoshock',1)
EmaSubFig(P3m66C{1},CBins,2,Xs(2),'                 Control Cells \newline 3 minutes after 66% Osmoshock',0)
EmaSubFig(P10m66C{1},CBins,3,Xs(2),'                 Control Cells \newline 10 minutes after 66% Osmoshock',0)
EmaSubFig(P3m80C{1},CBins,4,Xs(2),'                 Control Cells \newline 3 minutes after 80% Osmoshock',0)
EmaSubFig(P10m80C{1},CBins,5,Xs(2),'                 Control Cells \newline 10 minutes after 80% Osmoshock',0)

figure

[H,CBins2]=hist(PreC{2}/10^4,CBins);
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
Xs=CDF_PrctileLines(CBins2,CDF,PRCs,0);

EmaSubFig(PreC{2},CBins,1,Xs(2),' CALM siRNA Cells \newline Before Osmoshock',1)
EmaSubFig(P3m66C{2},CBins,2,Xs(2),'             CALM siRNA Cells \newline 3 minutes after 66% Osmoshock',0)
EmaSubFig(P10m66C{2},CBins,3,Xs(2),'             CALM siRNA Cells \newline 10 minutes after 66% Osmoshock',0)
EmaSubFig(P3m80C{2},CBins,4,Xs(2),'             CALM siRNA Cells \newline 3 minutes after 80% Osmoshock',0)
EmaSubFig(P10m80C{2},CBins,5,Xs(2),'             CALM siRNA Cells \newline 10 minutes after 80% Osmoshock',0)



%%

bins=10;

figure
HistCell({PreC{2},P3m66C{2},P10m66C{2}},bins)
title('siRNA cells under 66% water')
legend({'Control','3 minutes post','10 minutes post'})

figure
HistCell({PreC{2},P3m80C{2},P10m80C{2}},bins)
title('siRNA cells under 80% water')
legend({'Control','3 minutes post','10 minutes post'})

figure
HistCell({PreC{1},P3m66C{1},P10m66C{1}},bins)
title('control cells under 66% water')
legend({'Control','3 minutes post','10 minutes post'})

figure
HistCell({PreC{1},P3m80C{1},P10m80C{1}},bins)
title('control cells under 80% water')
legend({'Control','3 minutes post','10 minutes post'})

%%

bins=15;

figure
subplot(2,2,3)
CDFCell({PreC{2},P3m66C{2},P10m66C{2}},bins)
title('siRNA cells under 66% water')
legend({'Control','3 minutes post','10 minutes post'})
ylabel('CDF')
xlabel('Peak CALM Intensity of Pits')

subplot(2,2,4)
CDFCell({PreC{2},P3m80C{2},P10m80C{2}},bins)
title('siRNA cells under 80% water')
legend({'Control','3 minutes post','10 minutes post'})
ylabel('CDF')
xlabel('Peak CALM Intensity of Pits')

subplot(2,2,1)
CDFCell({PreC{1},P3m66C{1},P10m66C{1}},bins)
title('control cells under 66% water')
legend({'Control','3 minutes post','10 minutes post'})
ylabel('CDF')
xlabel('Peak CALM Intensity of Pits')

subplot(2,2,2)
CDFCell({PreC{1},P3m80C{1},P10m80C{1}},bins)
title('control cells under 80% water')
legend({'Control','3 minutes post','10 minutes post'})
ylabel('CDF')
xlabel('Peak CALM Intensity of Pits')

figure
CDFCell({PreC{1},PreC{2},P10m80C{2}},bins)
legend({'Control pre-osmo','siRNA pre-osmo','siRNA 10 minutes post 80% water'})
ylabel('CDF')
xlabel('Peak CALM Intensity of Pits')

figure
CDFCell({PreC{1},PreC{2},P10m80C{1},P10m80C{2}},bins)
legend({'Control pre-osmo','siRNA pre-osmo','control 10 minutes post 80% water','siRNA 10 minutes post 80% water'})
ylabel('CDF')
xlabel('Peak CALM Intensity of Pits')

[h,p]=kstest2(P10m80C{1},P10m80C{2});

%% Based on Full Trace Maxima

% clear all
% load('BothDSIO_DSIOFilesStruct.mat')
notbox=0;
YL=[0 7*10^4];
ClathMin=.6*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SIpreMS=[];
for i=1:length(SIpre)
    SIpreMS=[SIpreMS MSft{SIpre(i)}];
end
WTpreMS=[];
for i=1:length(WTpre)
    WTpreMS=[WTpreMS MSft{WTpre(i)}];
end

SI3m66MS=[];
for i=1:length(SI3m66)
    SI3m66MS=[SI3m66MS MSft{SI3m66(i)}];
end
WT3m66MS=[];
for i=1:length(WT3m66)
    WT3m66MS=[WT3m66MS MSft{WT3m66(i)}];
end

SI10m66MS=[];
for i=1:length(SI10m66)
    SI10m66MS=[SI10m66MS MSft{SI10m66(i)}];
end
WT10m66MS=[];
for i=1:length(WT10m66)
    WT10m66MS=[WT10m66MS MSft{WT10m66(i)}];
end

SI3m80MS=[];
for i=1:length(SI3m80)
    SI3m80MS=[SI3m80MS MSft{SI3m80(i)}];
end
WT3m80MS=[];
for i=1:length(WT3m80)
    WT3m80MS=[WT3m80MS MSft{WT3m80(i)}];
end

SI10m80MS=[];
for i=1:length(SI10m80)
    SI10m80MS=[SI10m80MS MSft{SI10m80(i)}];
end
WT10m80MS=[];
for i=1:length(WT10m80)
    WT10m80MS=[WT10m80MS MSft{WT10m80(i)}];
end

PreC={WTpreMS,SIpreMS};
P3m66C={WT3m66MS,SI3m66MS};
P10m66C={WT10m66MS,SI10m66MS};
P3m80C={WT3m80MS,SI3m80MS};
P10m80C={WT10m80MS,SI10m80MS};

if notbox
figure
subplot(2,3,1)
BoxPlotCell(PreC,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C,@notBoxPlot)
ylim(YL)
ylabel(ylab)
xticklabels(L)
else
figure
subplot(2,3,1)
BoxPlotCell(PreC)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C)
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C)
ylim(YL)
ylabel(ylab)
xticklabels(L)
end
figure
if notbox
BoxPlotCell({PreC{2},P3m66C{2},P10m66C{2}},@notBoxPlot)
title('siRNA cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{2},P3m80C{2},P10m80C{2}},@notBoxPlot)
title('siRNA cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})

BoxPlotCell({PreC{1},P3m66C{1},P10m66C{1}},@notBoxPlot)
title('Control cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{1},P3m80C{1},P10m80C{1}},@notBoxPlot)
title('Control cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
else
BoxPlotCell({PreC{2},P3m66C{2},P10m66C{2}})
title('siRNA cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{2},P3m80C{2},P10m80C{2}})
title('siRNA cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})

figure
BoxPlotCell({PreC{1},P3m66C{1},P10m66C{1}})
title('Control cells under 66% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
figure
BoxPlotCell({PreC{1},P3m80C{1},P10m80C{1}})
title('Control cells under 80% water')
ylabel('Max CALM Intensity by Trace')
xticklabels({'Control','3 minutes post','10 minutes post'})
end

%%
%clear all
%load('BothDSIO_DSIOFilesStruct.mat')
YL=[0 .2];
ClathMin=.5*10^4;
sig=1;
ylab='Full Traces/um^2/5 min';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

PreC={[DSIOfiles(WTpre).ClusteredFullTracesPerArea],[DSIOfiles(SIpre).ClusteredFullTracesPerArea]};
P3m66C={[DSIOfiles(WT3m66).ClusteredFullTracesPerArea],[DSIOfiles(SI3m66).ClusteredFullTracesPerArea]};
P10m66C={[DSIOfiles(WT10m66).ClusteredFullTracesPerArea],[DSIOfiles(SI10m66).ClusteredFullTracesPerArea]};
P3m80C={[DSIOfiles(WT3m80).ClusteredFullTracesPerArea],[DSIOfiles(SI3m80).ClusteredFullTracesPerArea]};
P10m80C={[DSIOfiles(WT10m80).ClusteredFullTracesPerArea],[DSIOfiles(SI10m80).ClusteredFullTracesPerArea]};

figure
subplot(2,3,1)
BoxPlotCell(PreC,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(1)]=kstest2(PreC{1},PreC{2});
    if p(1)>.05
       % p(1)=nan;
    end
    sigstar([1 2],p(1))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,2)
BoxPlotCell(P3m66C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(2)]=kstest2(P3m66C{1},P3m66C{2});
    if p(2)>.05
       % p(2)=nan; 
    end
    sigstar([1 2],p(2))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,3)
BoxPlotCell(P10m66C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(3)]=kstest2(P10m66C{1},P10m66C{2});
    if p(3)>.05
      %  p(3)=nan;
    end
    sigstar([1 2],p(3))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,5)
BoxPlotCell(P3m80C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(4)]=kstest2(P3m80C{1},P3m80C{2});
    if p(4)>.05
       % p(4)=nan;
    end
    sigstar([1 2],p(4))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
subplot(2,3,6)
BoxPlotCell(P10m80C,@notBoxPlot)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(5)]=kstest2(P10m80C{1},P10m80C{2});
    if p(5)>.05
       % p(5)=nan;
    end
    sigstar([1 2],p(5))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)

%%  Same with both times of 66% pooled
% clear all
% load('BothDSIO_DSIOFilesStruct.mat')
YL=[0 .04];
ClathMin=.5*10^4;
sig=0;
ylab='Full Traces/um^2/min';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]>=1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]>=1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

PreC={[DSIOfiles(WTpre).ClusteredFullTracesPerArea]/5,[DSIOfiles(SIpre).ClusteredFullTracesPerArea]/5};
P3m66C={[DSIOfiles(WT3m66).ClusteredFullTracesPerArea]/5,[DSIOfiles(SI3m66).ClusteredFullTracesPerArea]/5};
P10m66C={[DSIOfiles(WT10m66).ClusteredFullTracesPerArea]/5,[DSIOfiles(SI10m66).ClusteredFullTracesPerArea]/5};
P3m80C={[DSIOfiles(WT3m80).ClusteredFullTracesPerArea]/5,[DSIOfiles(SI3m80).ClusteredFullTracesPerArea]/5};
P10m80C={[DSIOfiles(WT10m80).ClusteredFullTracesPerArea]/5,[DSIOfiles(SI10m80).ClusteredFullTracesPerArea]/5};

figure
subplot(2,2,1)
BoxPlotCell(PreC,@notBoxPlot)
ylim(YL)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(1)]=kstest2(PreC{1},PreC{2});
    if p(1)>.05
       p(1)=nan;
    end
    sigstar([1 2],p(1))
end

ylabel(ylab)
xticklabels(L)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
subplot(2,2,2)
BoxPlotCell(P3m66C,@notBoxPlot)
ylim(YL)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(2)]=kstest2(P3m66C{1},P3m66C{2});
    if p(2)>.05
       p(2)=nan; 
    end
    sigstar([1 2],p(2))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
% subplot(2,2,3)
% BoxPlotCell(P10m66C,@notBoxPlot)
% if sig
%     %[~,p]=ttest2(Ncwt,Ncsi);
%     [~,p(3)]=kstest2(P10m66C{1},P10m66C{2});
%     if p(3)>.05
%       %  p(3)=nan;
%     end
%     sigstar([1 2],p(3))
% end
% ylim(YL)
% ylabel(ylab)
% xticklabels(L)
subplot(2,2,4)
BoxPlotCell(P3m80C,@notBoxPlot)
ylim(YL)
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p(4)]=kstest2(P3m80C{1},P3m80C{2});
    if p(4)>.05
       p(4)=nan;
    end
    sigstar([1 2],p(4))
end
ylim(YL)
ylabel(ylab)
xticklabels(L)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
% subplot(2,2,6)
% BoxPlotCell(P10m80C,@notBoxPlot)
% if sig
%     %[~,p]=ttest2(Ncwt,Ncsi);
%     [~,p(5)]=kstest2(P10m80C{1},P10m80C{2});
%     if p(5)>.05
%        % p(5)=nan;
%     end
%     sigstar([1 2],p(5))
% end
% ylim(YL)
% ylabel(ylab)
% xticklabels(L)

%%

YL=[0 10*10^4];
ClathMin=.5*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SIpreLT=[];
for i=1:length(SIpre)
    SIpreLT=[SIpreLT LT{SIpre(i)}];
end
WTpreLT=[];
for i=1:length(WTpre)
    WTpreLT=[WTpreLT LT{WTpre(i)}];
end

SI3m66LT=[];
for i=1:length(SI3m66)
    SI3m66LT=[SI3m66LT LT{SI3m66(i)}];
end
WT3m66LT=[];
for i=1:length(WT3m66)
    WT3m66LT=[WT3m66LT LT{WT3m66(i)}];
end

SI10m66LT=[];
for i=1:length(SI10m66)
    SI10m66LT=[SI10m66LT LT{SI10m66(i)}];
end
WT10m66LT=[];
for i=1:length(WT10m66)
    WT10m66LT=[WT10m66LT LT{WT10m66(i)}];
end

SI3m80LT=[];
for i=1:length(SI3m80)
    SI3m80LT=[SI3m80LT LT{SI3m80(i)}];
end
WT3m80LT=[];
for i=1:length(WT3m80)
    WT3m80LT=[WT3m80LT LT{WT3m80(i)}];
end

SI10m80LT=[];
for i=1:length(SI10m80)
    SI10m80LT=[SI10m80LT LT{SI10m80(i)}];
end
WT10m80LT=[];
for i=1:length(WT10m80)
    WT10m80LT=[WT10m80LT LT{WT10m80(i)}];
end

figure
subplot(2,2,2)
CDFCell({WTpreLT,WT3m80LT,WT10m80LT},10)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('Control Cells under 80% Water')
xlabel('Lifetime (s)')
ylabel('CDF')
subplot(2,2,1)
CDFCell({WTpreLT,WT3m66LT,WT10m66LT},20)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('Control Cells under 66% Water')
xlabel('Lifetime (s)')
ylabel('CDF')
subplot(2,2,4)
CDFCell({SIpreLT,SI3m80LT,SI10m80LT},10)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('siRNA Cells under 80% Water')
xlabel('Lifetime (s)')
ylabel('CDF')
subplot(2,2,3)
CDFCell({SIpreLT,SI3m66LT,SI10m66LT},20)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('siRNA Cells under 66% Water')
xlabel('Lifetime (s)')
ylabel('CDF')

%%
clear
load('BothDSIO_Struct_180920_EndoFilter_30s.mat')
YL=[0 10*10^4];
ClathMin=.5*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SIpreLT=[];
for i=1:length(SIpre)
    SIpreLT=[SIpreLT LT_EF{SIpre(i)}];
end
WTpreLT=[];
for i=1:length(WTpre)
    WTpreLT=[WTpreLT LT_EF{WTpre(i)}];
end

SI3m66LT=[];
for i=1:length(SI3m66)
    SI3m66LT=[SI3m66LT LT_EF{SI3m66(i)}];
end
WT3m66LT=[];
for i=1:length(WT3m66)
    WT3m66LT=[WT3m66LT LT_EF{WT3m66(i)}];
end

SI10m66LT=[];
for i=1:length(SI10m66)
    SI10m66LT=[SI10m66LT LT_EF{SI10m66(i)}];
end
WT10m66LT=[];
for i=1:length(WT10m66)
    WT10m66LT=[WT10m66LT LT_EF{WT10m66(i)}];
end

SI3m80LT=[];
for i=1:length(SI3m80)
    SI3m80LT=[SI3m80LT LT_EF{SI3m80(i)}];
end
WT3m80LT=[];
for i=1:length(WT3m80)
    WT3m80LT=[WT3m80LT LT_EF{WT3m80(i)}];
end

SI10m80LT=[];
for i=1:length(SI10m80)
    SI10m80LT=[SI10m80LT LT_EF{SI10m80(i)}];
end
WT10m80LT=[];
for i=1:length(WT10m80)
    WT10m80LT=[WT10m80LT LT_EF{WT10m80(i)}];
end

figure
subplot(2,2,2)
CDFCell({WTpreLT,WT3m80LT,WT10m80LT},10)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('Control Cells under 80% Water')
xlabel('Lifetime (s)')
ylabel('CDF')
subplot(2,2,1)
CDFCell({WTpreLT,WT3m66LT,WT10m66LT},20)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('Control Cells under 66% Water')
xlabel('Lifetime (s)')
ylabel('CDF')
subplot(2,2,4)
CDFCell({SIpreLT,SI3m80LT,SI10m80LT},10)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('siRNA Cells under 80% Water')
xlabel('Lifetime (s)')
ylabel('CDF')
subplot(2,2,3)
CDFCell({SIpreLT,SI3m66LT,SI10m66LT},20)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('siRNA Cells under 66% Water')
xlabel('Lifetime (s)')
ylabel('CDF')
%%

YL=[0 10*10^4];
ClathMin=.5*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SIpreStallS=[];
for i=1:length(SIpre)
    SIpreStallS=[SIpreStallS StallS{SIpre(i)}];
end
WTpreStallS=[];
for i=1:length(WTpre)
    WTpreStallS=[WTpreStallS StallS{WTpre(i)}];
end

SI3m66StallS=[];
for i=1:length(SI3m66)
    SI3m66StallS=[SI3m66StallS StallS{SI3m66(i)}];
end
WT3m66StallS=[];
for i=1:length(WT3m66)
    WT3m66StallS=[WT3m66StallS StallS{WT3m66(i)}];
end

SI10m66StallS=[];
for i=1:length(SI10m66)
    SI10m66StallS=[SI10m66StallS StallS{SI10m66(i)}];
end
WT10m66StallS=[];
for i=1:length(WT10m66)
    WT10m66StallS=[WT10m66StallS StallS{WT10m66(i)}];
end

SI3m80StallS=[];
for i=1:length(SI3m80)
    SI3m80StallS=[SI3m80StallS StallS{SI3m80(i)}];
end
WT3m80StallS=[];
for i=1:length(WT3m80)
    WT3m80StallS=[WT3m80StallS StallS{WT3m80(i)}];
end

SI10m80StallS=[];
for i=1:length(SI10m80)
    SI10m80StallS=[SI10m80StallS StallS{SI10m80(i)}];
end
WT10m80StallS=[];
for i=1:length(WT10m80)
    WT10m80StallS=[WT10m80StallS StallS{WT10m80(i)}];
end

figure
subplot(2,2,2)
CDFCell({WTpreStallS,WT3m80StallS,WT10m80StallS},10)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('Control Cells under 80% Water')
xlabel('CALM Intensity of Stalled Structures')
ylabel('CDF')
subplot(2,2,1)
CDFCell({WTpreStallS,WT3m66StallS,WT10m66StallS},20)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('Control Cells under 66% Water')
xlabel('CALM Intensity of Stalled Structures')
ylabel('CDF')
subplot(2,2,4)
CDFCell({SIpreStallS,SI3m80StallS,SI10m80StallS},10)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('siRNA Cells under 80% Water')
xlabel('CALM Intensity of Stalled Structures')
ylabel('CDF')
subplot(2,2,3)
CDFCell({SIpreStallS,SI3m66StallS,SI10m66StallS},20)
legend({'Pre-Osmoshock','3 minutes Post-Osmoshock','10 minutes Post-Osmoshock'},'Location','southeast')
title('siRNA Cells under 66% Water')
xlabel('CALM Intensity of Stalled Structures')
ylabel('CDF')

%%

YL=[0 10*10^4];
ClathMin=.5*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SIpreAC_P=[];
for i=1:length(SIpre)
    SIpreAC_P=[SIpreAC_P AC_P{SIpre(i)}];
end
WTpreAC_P=[];
for i=1:length(WTpre)
    WTpreAC_P=[WTpreAC_P AC_P{WTpre(i)}];
end

SI3m66AC_P=[];
for i=1:length(SI3m66)
    SI3m66AC_P=[SI3m66AC_P AC_P{SI3m66(i)}];
end
WT3m66AC_P=[];
for i=1:length(WT3m66)
    WT3m66AC_P=[WT3m66AC_P AC_P{WT3m66(i)}];
end

SI10m66AC_P=[];
for i=1:length(SI10m66)
    SI10m66AC_P=[SI10m66AC_P AC_P{SI10m66(i)}];
end
WT10m66AC_P=[];
for i=1:length(WT10m66)
    WT10m66AC_P=[WT10m66AC_P AC_P{WT10m66(i)}];
end

SI3m80AC_P=[];
for i=1:length(SI3m80)
    SI3m80AC_P=[SI3m80AC_P AC_P{SI3m80(i)}];
end
WT3m80AC_P=[];
for i=1:length(WT3m80)
    WT3m80AC_P=[WT3m80AC_P AC_P{WT3m80(i)}];
end

SI10m80AC_P=[];
for i=1:length(SI10m80)
    SI10m80AC_P=[SI10m80AC_P AC_P{SI10m80(i)}];
end
WT10m80AC_P=[];
for i=1:length(WT10m80)
    WT10m80AC_P=[WT10m80AC_P AC_P{WT10m80(i)}];
end

SIpreStallAC=[];
for i=1:length(SIpre)
    SIpreStallAC=[SIpreStallAC StallAC{SIpre(i)}];
end
WTpreStallAC=[];
for i=1:length(WTpre)
    WTpreStallAC=[WTpreStallAC StallAC{WTpre(i)}];
end

SI3m66StallAC=[];
for i=1:length(SI3m66)
    SI3m66StallAC=[SI3m66StallAC StallAC{SI3m66(i)}];
end
WT3m66StallAC=[];
for i=1:length(WT3m66)
    WT3m66StallAC=[WT3m66StallAC StallAC{WT3m66(i)}];
end

SI10m66StallAC=[];
for i=1:length(SI10m66)
    SI10m66StallAC=[SI10m66StallAC StallAC{SI10m66(i)}];
end
WT10m66StallAC=[];
for i=1:length(WT10m66)
    WT10m66StallAC=[WT10m66StallAC StallAC{WT10m66(i)}];
end

SI3m80StallAC=[];
for i=1:length(SI3m80)
    SI3m80StallAC=[SI3m80StallAC StallAC{SI3m80(i)}];
end
WT3m80StallAC=[];
for i=1:length(WT3m80)
    WT3m80StallAC=[WT3m80StallAC StallAC{WT3m80(i)}];
end

SI10m80StallAC=[];
for i=1:length(SI10m80)
    SI10m80StallAC=[SI10m80StallAC StallAC{SI10m80(i)}];
end
WT10m80StallAC=[];
for i=1:length(WT10m80)
    WT10m80StallAC=[WT10m80StallAC StallAC{WT10m80(i)}];
end

% figure
% subplot(4,3,1)
% CDFCell({SIpreAC_P,SIpreStallAC},15)
% legend('Productive Pits','Stalled Pits')
% xlabel('CALM:Clathrin Ratio')
% ylabel('CDF')
% title('siRNA Cells before osmotic shock')
% 
% subplot(4,3,7)
% CDFCell({WTpreAC_P,WTpreStallAC},15)
% legend('Productive Pits','Stalled Pits')
% xlabel('CALM:Clathrin Ratio')
% ylabel('CDF')
% title('Control Cells before osmotic shock')
for i=1:length(SIpre)
    SuperSubplot(i)
    Ind=SIpre(i);
    CDFCell({AC_P{Ind},StallAC{Ind}},15)
    
    if i==1
        title('siRNA cells before osmotic shock')
        legend('Productive Pits','Stalled Pits')
    end
end
for i=1:length(SI3m80)
    SuperSubplot(i)
    Ind=SIpre(i);
    CDFCell({AC_P{Ind},StallAC{Ind}},15)
    
    if i==1
        title('siRNA cells 3 min after osmotic shock')
        legend('Productive Pits','Stalled Pits')
    end
end
for i=1:length(SI10m80)
    SuperSubplot(i)
    Ind=SIpre(i);
    CDFCell({AC_P{Ind},StallAC{Ind}},15)
    
    if i==1
        title('siRNA cells 10 min after osmotic shock')
        legend('Productive Pits','Stalled Pits')
    end
end