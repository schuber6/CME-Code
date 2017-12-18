function [Selected,Cs]=PlotManualFitChanges_Averages_WManual(events,Is,MIs,xbins)


Drops=[];
Uppers=[];
Conversion=mean(nonzeros(Is))/mean(nonzeros(MIs));
i=1;
ind=1;
while i<length(events(:,1))
    Xi=events(i,2);
    Yi=events(i,3);
    INTS{ind}=Is(i);
    mINTS{ind}=MIs(i);
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
                mINTS{ind}=[mINTS{ind} MIs(i+offset)];
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
    for i2=2:length(mINTS{ind})-1
        DropsT=[DropsT mean(mINTS{ind}(1:i2-1))-mean(mINTS{ind}(i2+1:length(mINTS{ind})))];
    end
    if ~isempty(DropsT)
        Drops(ind)=max(DropsT);
    else
        Drops(ind)=0;
    end
    best=find(DropsT==max(DropsT));
    if ~isempty(best)
        Uppers(ind)=mean(mINTS{ind}(1:best(1)));
        Lowers(ind)=mean(mINTS{ind}(best(1)+2:end));
        FINTS{ind}=[zeros(1,best(1))+Uppers(ind) mean([Uppers(ind) Lowers(ind)]) zeros(1,length(mINTS{ind})-best(1)-1)+Lowers(ind)];
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
    plot(mINTS{T(i)}*Conversion,'k')
    PValue=ChiSquaredPValue(mINTS{T(i)}*Conversion,FINTS{T(i)},length(mINTS{T(i)})-2);
    RValue=RSquaredValue(mINTS{T(i)}*Conversion,FINTS{T(i)});
    title(strcat('R^2-Value=',num2str(RValue)))
    for i2=1:length(Evs{T(i)})
        Selected=[Selected ; events(Evs{T(i)}(i2),:)];
        Cs=[Cs ; colors(i,:)];
    end
end