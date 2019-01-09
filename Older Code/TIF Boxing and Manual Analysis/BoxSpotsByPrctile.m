function BoxSpotsByPrctile(FXYCMS,movie)
    
    MIs=[];
    events=[];
    for i=1:length(FXYCMS)
        used=find(FXYCMS{i}(:,6)>0);
        MIs=[MIs ; FXYCMS{i}(used,6)];
        events=[events ; FXYCMS{i}(used,1:3)];
    end
    for i=1:9
        cutoff(i)=prctile(MIs,i*10);
    end
    cutoff(10)=max(MIs)+1;
    cols=distinguishable_colors(10,[0 0 0]);
    Cs=zeros(length(MIs),3);
    for i=1:length(MIs)
        Group=find(cutoff>MIs(i),1,'first');
        Cs(i,:)=cols(Group(1),:);
    end
    newfile=strcat(movie(1:end-4),'_PrctileBox.tif');
    BoxEventsColors_RGB(movie,newfile,events,Cs)
    