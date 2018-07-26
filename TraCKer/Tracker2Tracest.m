function Tracest=Tracker2Tracest(TraceX,TraceY,TraceINT,varargin)
    %Third arg if present gets displayed in area graph
    %Second arg gives value of trace (whatever you want that to mean)
    
    if nargin==3
        for i=1:length(TraceX(:,1))
            Tracest(i).frame=find(TraceX(i,:)~=0);
            Tracest(i).xpos=nonzeros(TraceX(i,:));
            Tracest(i).ypos=nonzeros(TraceY(i,:));
            Tracest(i).int=nonzeros(TraceINT(i,:));
            Tracest(i).ishot=0;
            Tracest(i).ispair=0;
            Tracest(i).SNR=zeros(1,length(Tracest(i).frame))+1;
            Tracest(i).area=zeros(1,length(Tracest(i).frame))+1;
            Tracest(i).Value=0;
        end
    else
        if nargin==4
            for i=1:length(TraceX(:,1))
                Tracest(i).frame=find(TraceX(i,:)~=0);
                Tracest(i).xpos=nonzeros(TraceX(i,:));
                Tracest(i).ypos=nonzeros(TraceY(i,:));
                Tracest(i).int=nonzeros(TraceINT(i,:));
                Tracest(i).ishot=0;
                Tracest(i).ispair=0;
                Tracest(i).SNR=zeros(1,length(Tracest(i).frame))+1;
                Tracest(i).area=zeros(1,length(Tracest(i).frame))+1;
                Tracest(i).Value=varargin{1}(i);
            end
            %         else
            %             Ar=varargin{1};
%             for i=1:length(FXYCMS)
%                 fxyc=FXYCMS{i};
%                 Tracest(i).frame=fxyc(:,1);
%                 Tracest(i).xpos=fxyc(:,2);
%                 Tracest(i).ypos=fxyc(:,3);
%                 Tracest(i).int=fxyc(:,7);
%                 Tracest(i).ishot=0;
%                 Tracest(i).ispair=0;
%                 Tracest(i).SNR=zeros(1,length(fxyc(:,6)))+1;
%                 Tracest(i).area=Ar{i};
%                 Tracest(i).Value=varargin{1}(i);
%             end
        end
    end