function Tracest=NSTA2Tracest(nsta)
    %Third arg if present gets displayed in area graph
    %Second arg gives value of trace (whatever you want that to mean)
    

        for i=1:length(nsta)
            
            Tracest(i).frame=nsta(i).frame;
            Tracest(i).xpos=nsta(i).xpos;
            Tracest(i).ypos=nsta(i).ypos;
            Tracest(i).int=nsta(i).int;
            Tracest(i).ishot=0;
            Tracest(i).ispair=0;
            Tracest(i).SNR=zeros(1,length(nsta(i).frame))+1;
            Tracest(i).area=zeros(1,length(nsta(i).frame))+1;
            Tracest(i).Value=0;
            Tracest(i).mask=zeros(11,11,length(Tracest(i).frame));
            for i2=1:length(Tracest(i).frame)
                Tracest(i).mask(6,6,i2)=1;
            end
            Tracest(i).donutframe=[];
        end