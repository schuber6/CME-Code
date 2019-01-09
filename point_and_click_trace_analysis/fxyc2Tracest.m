function Tracest=fxyc2Tracest(FXYC)
    %Third arg if present gets displayed in area graph
    %Second arg gives value of trace (whatever you want that to mean)
    
    
        for i=1:length(FXYC(1,1,:))
            used=find(FXYC(:,1,i));
            fxyc=FXYC(used,:,i);
            Tracest(i).frame=fxyc(:,1);
            Tracest(i).xpos=fxyc(:,2);
            Tracest(i).ypos=fxyc(:,3);
            Tracest(i).int=fxyc(:,5);
            Tracest(i).ishot=0;
            Tracest(i).ispair=0;
            Tracest(i).SNR=zeros(1,length(fxyc(:,5)))+1;
            Tracest(i).area=zeros(1,length(fxyc(:,5)))+1;
            Tracest(i).Value=0;
            Tracest(i).mask=zeros(11,11,length(fxyc(:,1)));
            for i2=1:length(fxyc(:,1))
                Tracest(i).mask(6,6,i2)=1;
            end
            Tracest(i).donutframe=[];
        end
    