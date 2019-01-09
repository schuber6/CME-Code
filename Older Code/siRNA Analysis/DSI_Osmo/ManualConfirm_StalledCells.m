clear
load('BothDSIO_Struct_Clusters.mat')

MaxLTF=Inf;
FrameGap=2;
MinLTF=5;
Tmast=0;
ClathMin=.5*10^4;

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

Gs={SIpre,WT3m80,SI10m80,WT10m80,SI3m80};

for Group=4:4
    Group
    for i=2:2 %1:length(Gs{Group})
        i/length(Gs{Group})

        Ind=Gs{Group}(i);
        ManualConclusionAnalysis(DSIOfiles(Ind).file,DSIOfiles(Ind).movieR);
%         load(DSIOfiles(Ind).file)
%         [Nc,Fs,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,MaxLTF,1);
%         FXYC3={};
%         ind=1;
%         for i2=1:length(FXYCMS_Sel)
%             fxyc=FXYCMS_Sel{i2};
%             if fxyc(1,4)==3
%                 FXYC3{ind}=fxyc;
%                 ind=ind+1;
%             end
%         end
%         FXYCMS_G{Ind}=Manual_ConfirmTraces_FXYCMS(FXYC3);
%         MS=[];
%         for i2=1:length(FXYCMS_G{Ind})
%             fxyc=FXYCMS_G{Ind}{i2};
%             MS=[MS max(fxyc(:,7))];
%         end
%         MSft{i}=MS;
    end
end

%%
Ind=42;
ManualConclusionAnalysis(DSIOfiles(Ind).file,DSIOfiles(Ind).movieR);

%%
clear
load('BothDSIO_Struct_181024_EndoFilter_FullTraces.mat')
MaxLTF=Inf;
FrameGap=2;
MinLTF=5;
Tmast=0;
ClathMin=.5*10^4; 

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

Gs={WT10m66,SI10m80,WT10m80,SI3m80};

for Group=2:length(Gs)
    
    for i=1:length(Gs{Group})
        Ind=Gs{Group}(i);
        [MS{Ind},Nc(Ind),LT{Ind},~,MSLT{Ind},MM{Ind}]=ManualConclusionAnalysis_Results(DSIOfiles(Ind).file);
        [MS_EF{Ind},Nc_EF(Ind),LT_EF{Ind},~,MSLT_EF{Ind},MM_EF{Ind},FXYC_EF{Ind}]=ManualConclusionAnalysis_Results_EndoFileter(DSIOfiles(Ind).file);
        LT{Ind}=LT{Ind}*FrameGap;
        LT_EF{Ind}=LT_EF{Ind}*FrameGap;
        if ~isempty(MSLT{Ind})
            MSLT{Ind}(:,2)=MSLT{Ind}(:,2)*FrameGap;
        end
    end
end

%save('BothDSIO_Struct_180920_EndoFilter_30s.mat','DSIOfiles','MS_EF','MM_EF','LT_EF','MSLT_EF')
%save('BothDSIO_Struct_180914_LTs.mat','DSIOfiles','MS','LT')
%%
clear CALM CA Clath CL LT
Group=1;
ind=1;
ind2=1;
for i=1:length(Gs{Group})
    M=Gs{Group}(i);
    fxycC=FXYC_EF{M};
    CA{i}=[];
    CL{i}=[];
    for i2=1:length(fxycC)
        fxyc=fxycC{i2};
        fxycG{ind}=fxyc;

        CALM(ind)=max(fxyc(:,7))/10^4;
        CA{i}(i2)=max(fxyc(:,7))/10^4;
        Clath(ind)=max(fxyc(:,6))/10^4;
        CL{i}(i2)=max(fxyc(:,6))/10^4;
        LT{i}(i2)=length(fxyc(:,6))*2;
        if CA{i}(i2)<=1.5 && LT{i}(i2)<=90 && fxyc(1,4)==3
            SuperSubplot(ind2)
            t=(1:length(fxyc(:,6)))*2;
            plot(t,fxyc(:,6),'r')
            hold on
            plot(t,fxyc(:,7),'g')
            ind2=ind2+1;
        end
        %         title(num2str(max(fxyc(:,7))/10^4))
        cropR{ind}=PitAtMax(fxyc,DSIOfiles(M).movieR);
        cropG{ind}=PitAtMax(fxyc,DSIOfiles(M).movieG);
        ind=ind+1;
    end
end
%%
figure
for i=1:length(Gs{Group})
    subplot(2,3,i)
    usedr=find(CA{i}<=1.5 & LT{i}<=90);
    scatter(CA{i},CL{i})
    hold on
    scatter(CA{i}(usedr),CL{i}(usedr),'r')
    xlabel('Peak CALM Intensity')
    ylabel('Peak Clathrin Intensity')
    xlim([0 7])
    ylim([0 7])
    legend({'All Pits','Ema Region'},'Location','southeast')
end

%%
sorted=sort(CALM);
for i=1:length(cropG)
    ind=find(CALM==sorted(i));
    SuperSubplot(i)
    %imagesc(cropG{ind(1)})
    imshow(cropG{ind(1)},[0 max(max(cropG{ind(1)}))])
    title(num2str(sorted(i)))
end
%%
sorted=sort(CALM);
for i=1:length(cropG)
    ind=find(CALM==sorted(i));
    fxyc=fxycG{ind(1)};
    SuperSubplot(i)
    t=fxyc(:,1)*2;
    plot(t,fxyc(:,6),'r')
    hold on
    plot(t,fxyc(:,7),'g')
    YL=ylim;
    ylim([0 YL(2)])
    title(num2str(sorted(i)))
end
%%

Gs={SI10m80,WT10m80,SI3m80};
mslt_EF=[];
for Group=2:2
    for i=1:length(Gs{Group})
        Ind=Gs{Group}(i);
        if ~isempty(MSLT_EF{Ind})
            mslt_EF=[mslt_EF ; MSLT_EF{Ind}];
        end
    end
end

%%

Gs={SI10m80,WT10m80,SI3m80};
msmm=[];
for Group=1:1
    for i=1:length(Gs{Group})
        Ind=Gs{Group}(i);
        if ~isempty(MS{Ind})
            msmm=[msmm ; [MS{Ind}.' MM{Ind}.']];
        end
    end
end

figure
scatter(msmm(:,2),msmm(:,1))

%%

figure
scatter(mslt_EF(:,2)*2,mslt_EF(:,1))
xlabel('Lifetime (s)')
ylabel('Peak CALM Intensity')

%%
used=find(mslt(:,2)>=30);
figure
C={WTpreMS, WT3m80MS, mslt(used,1)};
CDFCell(C,10)
