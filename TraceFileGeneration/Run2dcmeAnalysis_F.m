function Run2dcmeAnalysis_F(folder)
    
    file=FindFiles(strcat(folder,'\orig_movies'),'*.tif');
    N=length(file);
    fg=zeros(1,N) +3;
    thresh=fg*400/3;
    comb_run(folder,fg,thresh);