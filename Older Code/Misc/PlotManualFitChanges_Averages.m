function [Selected,Cs]=PlotManualFitChanges_Averages(events,Is,xbins)


Drops=[];
Uppers=[];
i=1;
ind=1;
while i<length(events(:,1))
    Xi=events(i,2);
    Yi=events(i,3);
    INTS{ind}=Is(i);
    Evs{ind}=i;
    DropsT=[];
    missed=0;
    offset=1;
    while ~missed
        if i+offset<=length(events(:,1))
            Xf=events(i+offset,2);
            Yf=events(i+offset,3);
            D=norm([Xi-Xf Yi-Yf]);
            if D<=3
                INTS{ind}=[INTS{ind} Is(i+offset)];
                Evs{ind}=[Evs{ind} i+offset];
            else
                break
            end
            offset=offset+1;
        else
            break
        end
    end
    i=i+offset+1;
    for i2=2:length(INTS{ind})-1
        DropsT=[DropsT mean(INTS{ind}(1:i2-1))-mean(INTS{ind}(i2+1:length(INTS{ind})))];
    end
    if ~isempty(DropsT)
        Drops(ind)=max(DropsT);
    else
        Drops(ind)=0;
    end
    best=find(DropsT==max(DropsT));
    if ~isempty(best)
        Uppers(ind)=mean(INTS{ind}(1:best(1)));
        Lowers(ind)=mean(INTS{ind}(best(1)+2:end));
        FINTS{ind}=[zeros(1,best(1))+Uppers(ind) mean([Uppers(ind) Lowers(ind)]) zeros(1,length(INTS{ind})-best(1)-1)+Lowers(ind)];
    end
    ind=ind+1;
end
hist(nonzeros(Drops),xbins)
xlim([xbins(1) xbins(end)])
figure
used=find(Drops);
colors = distinguishable_colors(9);
Selected=[];
Cs=[];
for i=1:9
    subplot(3,3,i)
    T(i)=used(ceil(rand*length(used)));
    plot(INTS{T(i)},'Color',colors(i,:))
    hold on
    plot(FINTS{T(i)},'r')
    for i2=1:length(Evs{T(i)})
        Selected=[Selected ; events(Evs{T(i)}(i2),:)];
        Cs=[Cs ; colors(i,:)];
    end
end