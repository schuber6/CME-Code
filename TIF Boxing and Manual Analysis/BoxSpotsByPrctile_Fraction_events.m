function BoxSpotsByPrctile_Fraction_events(events,Is,movie,fraction)
    

    for i=1:9
        cutoff(i)=prctile(Is,i*10);
    end
    cutoff(10)=max(Is)+1;
    cols=distinguishable_colors(10,[0 0 0]);
    Cs=zeros(length(Is),3);
    for i=1:length(Is)
        Group=find(cutoff>Is(i),1,'first');
        Cs(i,:)=cols(Group(1),:);
    end
    newfile=strcat(movie(1:end-4),'_PrctileBox_',num2str(fraction),'.tif');
    Ns=ceil(length(Is)*fraction);
    used=randsample(length(Is),Ns);
    Sevents=events(used,:);
    SCs=Cs(used,:);
    BoxEventsColors_RGB(movie,newfile,Sevents,SCs)
    