file='E:\CME Superfolder\CME Data\190111_Analysis\100ms\TestMovie\orig_movies\cell004_C1.mat';
movie='E:\CME Superfolder\CME Data\190111_Analysis\100ms\TestMovie\orig_movies\cell004_C1.tif';
framegap=1;
[ML,F1]=MLCategorizeFXYC(file,movie,framegap);
ML=ML(:);
%%
BoxByC(file,movie,ML);

%%

file='E:\CME Superfolder\CME Data\190111_Analysis\100ms\TestMovie\orig_movies\cell004_C1_Data.mat';
save(file,'Data')
file='E:\CME Superfolder\CME Data\190111_Analysis\100ms\TestMovie\orig_movies\cell004_C1_Data.mat';
movie='E:\CME Superfolder\CME Data\190111_Analysis\100ms\TestMovie\orig_movies\cell004_C1.tif';
BoxByC_Data(file,movie)
%%
file='E:\CME Superfolder\CME Data\190111_Analysis\100ms\TestMovie\orig_movies\cell004_C1_Data.mat';
movie='E:\CME Superfolder\CME Data\190111_Analysis\100ms\TestMovie\orig_movies\cell004_C1.tif';
BoxAll_Data(file,movie)