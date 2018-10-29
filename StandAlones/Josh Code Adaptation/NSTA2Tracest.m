function Tracest=NSTA2Tracest(nsta)
    %Third arg if present gets displayed in area graph
    %Second arg gives value of trace (whatever you want that to mean)
    

        for i=1:length(nsta)
            
            Tracest(i).frame=nsta(i).frame;
            Tracest(i).xpos=nsta(i).xpos;
            Tracest(i).ypos=nsta(i).xpos;
            Tracest(i).int=nsta(i).int;
            Tracest(i).ishot=0;
            Tracest(i).ispair=0;
            Tracest(i).SNR=zeros(1,length(nsta(i).frame))+1;
            Tracest(i).area=zeros(1,length(nsta(i).frame))+1;
            Tracest(i).Value=0;
        end
    