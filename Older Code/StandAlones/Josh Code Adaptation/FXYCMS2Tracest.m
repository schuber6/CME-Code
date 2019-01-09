function Tracest=FXYCMS2Tracest(FXYCMS,varargin)
    %Third arg if present gets displayed in area graph
    %Second arg gives value of trace (whatever you want that to mean)
    
    if nargin==1
        for i=1:length(FXYCMS)
            fxyc=FXYCMS{i};
            Tracest(i).frame=fxyc(:,1);
            Tracest(i).xpos=fxyc(:,2);
            Tracest(i).ypos=fxyc(:,3);
            Tracest(i).int=fxyc(:,7);
            Tracest(i).ishot=0;
            Tracest(i).ispair=0;
            Tracest(i).SNR=zeros(1,length(fxyc(:,6)))+1;
            Tracest(i).area=zeros(1,length(fxyc(:,6)))+1;
            Tracest(i).Value=0;
            Tracest(i).mask=zeros(11,11,length(fxyc(:,1)));
            for i2=1:length(fxyc(:,1))
                Tracest(i).mask(6,6,i2)=1;
            end
            Tracest(i).donutframe=[];
        end
    else
        if nargin==2
            for i=1:length(FXYCMS)
                fxyc=FXYCMS{i};
                Tracest(i).frame=fxyc(:,1);
                Tracest(i).xpos=fxyc(:,2);
                Tracest(i).ypos=fxyc(:,3);
                Tracest(i).int=fxyc(:,7);
                Tracest(i).ishot=0;
                Tracest(i).ispair=0;
                Tracest(i).SNR=zeros(1,length(fxyc(:,6)))+1;
                Tracest(i).area=zeros(1,length(fxyc(:,6)))+1;
                Tracest(i).Value=varargin{1}(i);
            end
        else
            if nargin==3
                Ar=varargin{2};
                for i=1:length(FXYCMS)
                    fxyc=FXYCMS{i};
                    Tracest(i).frame=fxyc(:,1);
                    Tracest(i).xpos=fxyc(:,2);
                    Tracest(i).ypos=fxyc(:,3);
                    Tracest(i).int=fxyc(:,7);
                    Tracest(i).ishot=0;
                    Tracest(i).ispair=0;
                    Tracest(i).SNR=zeros(1,length(fxyc(:,6)))+1;
                    Tracest(i).area=Ar{i};
                    Tracest(i).Value=varargin{1}(i);
                end
            else
                Ar=varargin{2};
                for i=1:length(FXYCMS)
                    fxyc=FXYCMS{i};
                    Tracest(i).frame=fxyc(:,1);
                    Tracest(i).xpos=fxyc(:,2);
                    Tracest(i).ypos=fxyc(:,3);
                    Tracest(i).int=varargin{3}{i};
                    Tracest(i).ishot=0;
                    Tracest(i).ispair=0;
                    Tracest(i).SNR=zeros(1,length(fxyc(:,6)))+1;
                    Tracest(i).area=Ar{i};
                    Tracest(i).Value=varargin{1}(i);
                end
            end
            
        end
    end