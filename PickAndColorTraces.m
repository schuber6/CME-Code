function [MSD_chosen,Ts]=PickAndColorTraces(movie,MSD)

[MSD_chosen,Ts]=PickTraces(MSD);
figure
Events=[];
for i=1:length(MSD_chosen)
    subplot(3,3,i)
    plot(MSD_chosen{i}(:,4),'g')
    hold on
    plot(MSD_chosen{i}(:,5),'r')
    for i2=1:length(MSD_chosen{i}(:,1))
        Events=[Events ; [MSD_chosen{i}(i2,1) MSD_chosen{i}(i2,2) MSD_chosen{i}(i2,3)]];
    end
end
newmovie=strcat(movie(1:end-4),'_Picked_40p.tif');
BoxEvents(movie,newmovie,Events);