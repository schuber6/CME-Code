function Drops=TabulateTraceAverages(events,Is)


Drops=[];
i=1;
while i<length(events(:,1))
    Xi=events(i,2);
    Yi=events(i,3);
    INTS=Is(i);
    DropsT=[];
    missed=0;
    offset=1;
    while ~missed
        if i+offset<=length(events(:,1))
            Xf=events(i+offset,2);
            Yf=events(i+offset,3);
            D=norm([Xi-Xf Yi-Yf]);
            if D<=3
                INTS=[INTS Is(i+offset)];
            else
                break
            end
            offset=offset+1;
        else
            break
        end
    end
    i=i+offset+1;
    %for i2=2:length(INTS)-1
        Drops=[Drops mean(INTS)];
    %end
    %Drops=[Drops max(DropsT)];
end