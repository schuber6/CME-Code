function [Msd,Ssd,MM,MS,MI,SI,MSr,N,LT]=OsmoshockParameters(file,varargin)
    %Each parameter is a 1x2 with 1st value over the first 5 minutes of a
    %movie and 2nd is minutes 6-11 (assuming 3s frame rate)
    %Msd--Master Josh slope s.d.
    %MM--Master median max intensity of 3s
    %MI--Master median intensity of all spots
    %MSr--Median Master-slave ratio of max intensities of 3d
    %N--number of 3s
    
    load(file)
    if nargin==1
    PreRange=1:100;
    PostRange=120:220;
    FG=3;
    else
        FG=varargin{1};
        PreRange=1:floor(300/FG);
        PostRange=floor(360/FG):floor(660/FG);
    end
    MinL=10;

    thresh=0;
    ind=1;
    
    [MIs{1},SIs{1}]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PreRange,thresh);
    [MIs{2},SIs{2}]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PostRange,thresh);
    MI(1)=median(MIs{1});
    MI(2)=median(MIs{2});
    SI(1)=median(SIs{1});
    SI(2)=median(SIs{2});
    
    [IndsB,LTs{ind},MMs{ind},MSs{ind}]=FindAll3s_InRange(FXYCMS,PreRange,MinL,thresh);
    [IndsA,LTs{ind+1},MMs{ind+1},MSs{ind+1}]=FindAll3s_InRange(FXYCMS,PostRange,MinL,thresh);
    MM(1)=median(MMs{1});
    MM(2)=median(MMs{2});
    MS(1)=median(MSs{1});
    MS(2)=median(MSs{2});
    LT(1)=median(LTs{1});
    LT(2)=median(LTs{2});
    
    [Mslopes{ind},Sslopes{ind}]=FindAllJoshSlopes_InRange(FXYCMS,PreRange,thresh,FG);
    [Mslopes{ind+1},Sslopes{ind+1}]=FindAllJoshSlopes_InRange(FXYCMS,PostRange,thresh,FG);
    Msd(1)=sqrt(var(Mslopes{1}));
    Msd(2)=sqrt(var(Mslopes{2}));
    Ssd(1)=sqrt(var(Sslopes{1}));
    Ssd(2)=sqrt(var(Sslopes{2}));
    
    MSratio{ind}=MMs{ind}./MSs{ind};
    MSratio{ind+1}=MMs{ind+1}./MSs{ind+1};
    MSIratio{ind}=MIs{ind}./SIs{ind};
    MSIratio{ind+1}=MIs{ind+1}./SIs{ind+1};
    MSr(1)=median(MSratio{1});
    MSr(2)=median(MSratio{2});
    
    N(1)=length(MMs{1});
    N(2)=length(MMs{2});
    
%     normR=median(MSratio{ind});
%     MSratio{ind}=MSratio{ind}/normR;
%     MSratio{ind+1}=MSratio{ind+1}/normR;
%     normRI=median(MSIratio{ind});
%     MSIratio{ind}=MSIratio{ind}/normRI;
%     MSIratio{ind+1}=MSIratio{ind+1}/normRI;
%     MSratioLog{ind}=log(MSratio{ind});
%     MSratioLog{ind+1}=log(MSratio{ind+1});
%     MSIratioLog{ind}=log(MSIratio{ind});
%     MSIratioLog{ind+1}=log(MSIratio{ind+1});
%     L{ind}=strcat(Titles{(ind-1)/2+1},' Before Treatment');
%     L{ind+1}=strcat(Titles{(ind-1)/2+1},' After Treatment');
%     ind=ind+2;