function [Nc,varargout]=CountConclusions_BySlope_EndoFilter(FXYCMS,Tmast,MinLTF,FrameGap,varargin)
    
if nargin==4
    MaxLTF=MaxFrameFXYCMS(FXYCMS);
    dontcrop=0;
    mult=1;
else
    if nargin==5
        MaxLTF=varargin{1};
        dontcrop=0;
        mult=1;
    else
        if nargin==6
            MaxLTF=varargin{1};
            dontcrop=varargin{2};
            mult=1;
        else
            MaxLTF=varargin{1};
            dontcrop=varargin{2};
            mult=varargin{3};
        end
    end
end
    Cutoff=-.06; %Cutoff for growth rate (default -.06 for 2 second framegap)
    r2Cutoff=.80; %Cutoff for growth rate R^2 (default .85)
    DCutoff=2; %Cutoff for max distance moved during conclusion (default 1.5)
    FCutoff=0; %Cutoff for z-score of the likelihood that the intensities from the end of the conclusion match those from the beginning
    MinCutoff=10^4*mult;
    CACutoff=3;
    RadB=8; %Number of frames backwards and forwards to consider part of the conclusion
    RadF=4;
    Ni=0;
    Nc=0;
    Fs=[];
    FXYCMS_Sel={};
    slopes={};
    Minslope=[];
    Fades=[];
    D={};
    R2=[];
    MMs=[];
    MSs=[];
    Is=[];
    LTs=[];
    MSLTs=[];
    MinMs=[];
    ind=1;
    FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap);
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if length(fxyc(1,:))>=9
            C=fxyc(1,4);
            MM=max(fxyc(:,6));
            MS=max(fxyc(:,7));
            if MM>=Tmast && min(fxyc(:,8))<=Cutoff &&  length(fxyc(:,1))>=MinLTF && length(fxyc(:,1))<=MaxLTF
                F=find(fxyc(:,8)<=Cutoff,1,'last');
                L=length(fxyc(:,1));
                R=max(1,F(1)-RadB):min(L,F(1)+RadF);
                MM=max(fxyc(R,6));
                MinM=min(fxyc(R,6));
                MS=max(fxyc(R,7));
                D{ind}=zeros(1,length(R));
                for i2=1:length(R)-1
                    D{ind}(i2)=norm([fxyc(R(i2),2)-fxyc(R(i2+1),2) fxyc(R(i2),3)-fxyc(R(i2+1),3)]);
                end
                Fade=QuantifyConclusionFades(fxyc(R,6));
                if max(D{ind})<=DCutoff && fxyc(F(1),10)>=r2Cutoff && Fade<=FCutoff && MinM<=MinCutoff && MM/MS<CACutoff
                    Nc=Nc+1;
                    
                    Fs=[Fs fxyc(F(1),1)];
                    if fxyc(1,4)==3
                        LTs=[LTs length(fxyc(:,1))];
                        MSLTs=[MSLTs ; [MS length(fxyc(:,1))]];
                    end
                    
                    if ~dontcrop
                        FXYCMS_Sel{ind}=fxyc(R,:);
                        slopes{ind}=fxyc(R,8);
                        Minslope(ind)=min(fxyc(R,8));
                        D{ind}(length(R))=0;
                        R2(ind)=fxyc(F(1),10);
                        MMs(ind)=MM;
                        MinMs(ind)=MinM;
                        MSs(ind)=MS;
                        Fades(ind)=Fade;
                        Is(ind)=i;
                    else
                        FXYCMS_Sel{ind}=fxyc;
                        slopes{ind}=fxyc(:,8);
                        Minslope(ind)=min(fxyc(:,8));
                        R2(ind)=0;
                        MMs(ind)=max(fxyc(:,6));
                        MinMs(ind)=MinM;
                        MSs(ind)=max(fxyc(:,7));
                        Is(ind)=i;
                    end
                    ind=ind+1;
                end
            end
        end
    end
    varargout{1}=Fs;
    varargout{2}=FXYCMS_Sel;
    varargout{3}=slopes;
    varargout{4}=Minslope;
    
    varargout{5}=D;
    varargout{6}=R2;
    varargout{7}=MMs;
    varargout{8}=MSs;
    varargout{9}=Fades;
    varargout{10}=Is;
    varargout{11}=MinMs;
    varargout{12}=LTs;
    varargout{13}=MSLTs;