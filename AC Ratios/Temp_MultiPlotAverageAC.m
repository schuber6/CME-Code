folder='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies';
filesM=FindFiles(folder,'*.mat').';
FSFig
for i=1:length(filesM)
    load(filesM{i})
    if i==1
        cola='r';
        colc='r--';
    end
    if i==2
        cola='g';
        colc='g--';
    end
    if i==3
        cola='b';
        colc='b--';
    end
    PlotAverageAC_FXYCMS_Func(FXYCMS,1,cola,colc)
end