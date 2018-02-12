function PlotPhotobleachTraces(fxyc)

thresh=1200;
maxs=[];
for i=1:length(fxyc(1,1,:))
    maxs(i)=max(fxyc(:,5,i));
end
Good=find(maxs>=thresh);
for i=1:16
    subplot(4,4,i)
    T=Good(ceil(rand*length(Good)));
    INTS=nonzeros(fxyc(:,5,T));
    plot(INTS)
    hold on
    DropsT=[];
    for i2=2:length(INTS)-1
        DropsT=[DropsT mean(INTS(1:i2-1))-mean(INTS(i2+1:length(INTS)))];
    end
    best=find(DropsT==max(DropsT));
    FT=zeros(1,length(INTS));
    if ~isempty(best)
        Upper=mean(INTS(1:best(1)));
        Lower=mean(INTS(best(1)+2:end));
        for i2=1:best(1)
            FT(i2)=Upper;
        end
        FT(best(1)+1)=mean([Upper Lower]);
        for i2=best(1)+2:length(INTS)
            FT(i2)=Lower;
        end
    end
    plot(FT,'r')
end
figure
Drops=[];
for i=1:length(Good)
    %subplot(4,4,i)
    T=Good(i);
    INTS=nonzeros(fxyc(:,5,T));
    %plot(INTS)
    %hold on
    DropsT=[];
    for i2=2:length(INTS)-1
        DropsT=[DropsT mean(INTS(1:i2-1))-mean(INTS(i2+1:length(INTS)))];
    end
    best=find(DropsT==max(DropsT));
    FT=zeros(1,length(INTS));
    if ~isempty(best)
        Upper=mean(INTS(1:best(1)));
        Lower=mean(INTS(best(1)+2:end));
        for i2=1:best(1)
            FT(i2)=Upper;
        end
        FT(best(1)+1)=mean([Upper Lower]);
        for i2=best(1)+2:length(INTS)
            FT(i2)=Lower;
        end
        Drops=[Drops Upper-Lower];
    end
    %plot(FT,'r')
end
hist(Drops,100)


        
    
    
    