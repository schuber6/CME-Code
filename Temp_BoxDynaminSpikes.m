load('E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_1.tif';
newmovie='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_1_5000Thresh.tif';
newmovieN='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_1_5000BelowThresh.tif';
[Events,NonEvents]=FindDynaminSpikes(MSD,5000);
BoxEvents(movie,newmovie,Events)
BoxEvents(movie,newmovieN,NonEvents)

load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_1.tif';
newmovie='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_1_5000Thresh.tif';
newmovieN='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_1_5000BelowThresh.tif';
[Events,NonEvents]=FindDynaminSpikes(MSD,5000);
BoxEvents(movie,newmovie,Events)
BoxEvents(movie,newmovieN,NonEvents)
