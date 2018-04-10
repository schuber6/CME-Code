function Tracest=FXYCMS2Tracest(FXYCMS)
    
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