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

Gs={SI10m80,WT10m80,SI3m80};

for Group=1:1
    Group
    for i=1:length(Gs{Group})
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
load('BothDSIO_Struct_180913_LTs.mat')
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

Gs={SI10m80,WT10m80,SI3m80};

for Group=1:length(Gs)

    for i=1:length(Gs{Group})
        Ind=Gs{Group}(i);
        [MS{Ind},Nc(Ind),LT{Ind},~]=ManualConclusionAnalysis_Results(DSIOfiles(Ind).file);
        LT{Ind}=LT{Ind}*2;
    end
end

save('BothDSIO_Struct_180914_LTs.mat','DSIOfiles','MS','LT')
%%

