function [Nc,varargout]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,varargin)
    
    if nargin==4
        MaxLTF=MaxFrameFXYCMS(FXYCMS);
        dontcrop=0;
    else
        if nargin==5
        MaxLTF=varargin{1};
        dontcrop=0;
        else
            MaxLTF=varargin{1};
            dontcrop=varargin{2};
        end
    end
    Cutoff=-.06; %Cutoff for growth rate (default -.06 for 2 second framegap)
    r2Cutoff=.85; %Cutoff for growth rate R^2 (default .85)
    DCutoff=1.5; %Cutoff for max distance moved during conclusion (default 1.5)
    FCutoff=-3; %Cutoff for z-score of the likelihood that the intensities from the end of the conclusion match those from the beginning
    Rad=6; %Number of frames backwards and forwards to consider part of the conclusion
    Ni=0;
    Nc=0;
    Fs=[];
    FXYCMS_Sel={};
    slopes={};
    Minslope=[];
    D={};
    R2=[];
    MMs=[];
    MSs=[];
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
                R=max(1,F(1)-Rad):min(L,F(1)+Rad);
                MM=max(fxyc(R,6));
                MS=max(fxyc(R,7));
                D{ind}=zeros(1,length(R));
                for i2=1:length(R)-1
                    D{ind}(i2)=norm([fxyc(R(i2),2)-fxyc(R(i2+1),2) fxyc(R(i2),3)-fxyc(R(i2+1),3)]);
                end
                Fade=QuantifyConclusionFades(fxyc(R,6));
                if max(D{ind})<=DCutoff && fxyc(F(1),10)>=r2Cutoff && Fade<=FCutoff
                    Nc=Nc+1;
                    
                    Fs=[Fs fxyc(F(1),1)];
                    
                    
                    if ~dontcrop
                        FXYCMS_Sel{ind}=fxyc(R,:);
                        slopes{ind}=fxyc(R,8);
                        Minslope(ind)=min(fxyc(R,8));
                        D{ind}(length(R))=0;
                        R2(ind)=fxyc(F(1),10);
                        MMs(ind)=MM;
                        MSs(ind)=MS;
                    else
                        FXYCMS_Sel{ind}=fxyc;
                        slopes{ind}=fxyc(:,8);
                        Minslope(ind)=min(fxyc(:,8));
                        R2(ind)=0;
                        MMs(ind)=0;
                        MSs(ind)=0;
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