clear all
movie='Z:\Scott\donuts_from_nathan\Sim_movie4_2s.tif';
file='Z:\Scott\donuts_from_nathan\tracking_data_WClasses.mat';
load(file)
file2='Z:\Scott\donuts_from_nathan\categories.mat';
load(file2)
%%
S=sum(categories,2);
used=find(S.'==0 & [tracking_data.movie]==4 & [tracking_data.goodness]>=.5);
%%
r=ceil(rand*length(used))
I=used(r);
Xs=tracking_data(I).xpos;
Ys=tracking_data(I).ypos;
frames=round(tracking_data(I).frame);
CenterOfIntensityKymographF(movie,Xs,Ys,frames);