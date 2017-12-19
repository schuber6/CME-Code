load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_1.tif';
[MSD_chosen,Ts]=PickAndColorTraces(movie,MSD);

load('E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_1.tif';
[MSD_chosen2,Ts2]=PickAndColorTraces(movie,MSD);