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
load('180821_DSIOFilesStruct.mat')

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

PreC={[DSIOfiles(WTpre).ConcsPerArea],[DSIOfiles(SIpre).ConcsPerArea]};
P3m66C={[DSIOfiles(WT3m66).ConcsPerArea],[DSIOfiles(SI3m66).ConcsPerArea]};
P10m66C={[DSIOfiles(WT10m66).ConcsPerArea],[DSIOfiles(SI10m66).ConcsPerArea]};
P3m80C={[DSIOfiles(WT3m80).ConcsPerArea],[DSIOfiles(SI3m80).ConcsPerArea]};
P10m80C={[DSIOfiles(WT10m80).ConcsPerArea],[DSIOfiles(SI10m80).ConcsPerArea]};

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

clear all
load('BothDSIO_DSIOFilesStruct.mat')
YL=[0 10*10^4];
ClathMin=10^4;
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
