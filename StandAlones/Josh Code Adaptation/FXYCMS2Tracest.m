function Tracest=FXYCMS2Tracest(FXYCMS,varargin)
    %Second arg if present gives intensity of slave channel
    
    
    if nargin==1
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        Tracest(i).frame=fxyc(:,1);
        Tracest(i).xpos=fxyc(:,2);
        Tracest(i).ypos=fxyc(:,3);
        Tracest(i).int=fxyc(:,6);
        Tracest(i).ishot=0;
        Tracest(i).ispair=0;
        Tracest(i).SNR=zeros(1,length(fxyc(:,6)))+1;
        Tracest(i).area=zeros(1,length(fxyc(:,6)))+1;
    end
    else 
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
    end
    end