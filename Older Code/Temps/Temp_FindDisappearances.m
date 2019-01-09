load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\Stack_1.tif';
[MSD_chosenO1,Ts,Es]=FindAllPickTraces(MSD);
[Sav,Mav,Rav]=AverageTracesEsAligned(MSD_chosenO1,Es);
MSDO1=MSD;

load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_1.tif';
[MSD_chosenO2,Ts,Es]=FindAllPickTraces(MSD);
[Sav,Mav,Rav]=AverageTracesEsAligned(MSD_chosenO2,Es);
MSDO2=MSD;

load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\Stack_1.tif';
[MSD_chosenO3,Ts,Es]=FindAllPickTraces(MSD);
[Sav,Mav,Rav]=AverageTracesEsAligned(MSD_chosenO3,Es);
MSDO3=MSD;

load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\Stack_1.tif';
[MSD_chosenO4,Ts,Es]=FindAllPickTraces(MSD);
[Sav,Mav,Rav]=AverageTracesEsAligned(MSD_chosenO4,Es);
MSDO4=MSD;


load('E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_1.tif';
[MSD_chosenC2,Ts,Es]=FindAllPickTraces(MSD);
[Sav,Mav,Rav]=AverageTracesEsAligned(MSD_chosenC2,Es);
MSDC2=MSD;

load('E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\Stack_1.tif';
[MSD_chosenC3,Ts,Es]=FindAllPickTraces(MSD);
[Sav,Mav,Rav]=AverageTracesEsAligned(MSD_chosenC3,Es);
MSDC3=MSD;

load('E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\M2S1D.mat')
movie='E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\Stack_1.tif';
[MSD_chosenC1,Ts,Es]=FindAllPickTraces(MSD);
[Sav,Mav,Rav]=AverageTracesEsAligned(MSD_chosenC1,Es);
MSDC1=MSD;