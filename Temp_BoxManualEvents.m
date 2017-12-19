folder='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies';
movie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS.tif';
newmovie='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies\040_BS_ManualBoxes_New.tif';
colors = distinguishable_colors(length(Sevents));
events=[];
Cs=[];
count=1;
figure
for i=1:length(Sevents)
    if count>9
        count=1;
        figure
    end
    subplot(3,3,count)
    plot(SIs{i},'Color',colors(i,:))
    title(strcat('Frames:',num2str(Sevents{i}(1,1)),'-',num2str(Sevents{i}(end,1)),' Upper=',num2str(SUppers(i)),' Drop=',num2str(SDrops(i))))
    count=count+1;
    for i2=1:length(Sevents{i}(:,1))
        events=[events ; Sevents{i}(i2,:)];
        Cs=[Cs ; colors(i,:)];
    end
end
figure
subplot(1,2,1)
hist(SDrops,20)
subplot(1,2,2)
hist(SUppers,20)
figure
scatter(SUppers,SLowers)
BoxEventsColors(movie,newmovie,events,Cs);
