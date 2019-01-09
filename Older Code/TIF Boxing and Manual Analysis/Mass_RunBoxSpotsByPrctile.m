clear all
folder='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies';
filesM=FindFiles(folder,'*OffsetMS.tif').';
folder='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies';
filesF=FindFiles(folder,'*.mat').';
for i=1:length(filesM)
    load(filesF{i})
    BoxSpotsByPrctile_Fraction(FXYCMS,filesM{i},.1);
end