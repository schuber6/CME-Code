folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*.mat').';
load(files{2});

GoodFXYCMS={};
ind=1;
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(1,4)==3
      GoodFXYCMS{ind}=fxyc;
      ind=ind+1;
    end
end
PlotSlopeHistogram(FXYCMS)
PlotSlopeHistogram(GoodFXYCMS)