function [Drops,Uppers,RValues]=TabulateManualFitChanges_Averages(events,Is)


Drops=[];
Uppers=[];
RValues=[];
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
    for i2=2:length(INTS)-1
        DropsT=[DropsT mean(INTS(1:i2-1))-mean(INTS(i2+1:length(INTS)))];
    end
    Drops=[Drops max(DropsT)];
    best=find(DropsT==max(DropsT));
    if ~isempty(best)
        Uppers=[Uppers mean(INTS(1:best(1)))];
    
        Lowers=mean(INTS(best(1)+2:end));
        FINTS=[zeros(1,best(1))+Uppers(end) mean([Uppers(end) Lowers]) zeros(1,length(INTS)-best(1)-1)+Lowers];
        RV=RSquaredValue(INTS,FINTS);
        RValues=[RValues RV];
    end
end