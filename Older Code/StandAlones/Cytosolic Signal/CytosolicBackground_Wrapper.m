folder='E:\CME Superfolder\CME Data\SUM_CALM_BestData\WT\TIFs';
newfolder='E:\CME Superfolder\CME Data\SUM_CALM_BestData\WT\TIFs\orig_movies';
FirstFrameMovie(folder,newfolder);
Run2dcmeAnalysis_F(newfolder(1:end-12));

%%

[Cyt_WT,Back_WT,Area]=CytosolicBackground(newfolder);