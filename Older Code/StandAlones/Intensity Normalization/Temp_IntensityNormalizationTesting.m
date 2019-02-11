clear
load('190116_NewScopeMoviesCell.mat')
h=waitbar(0,'~');
for i=1:length(movies)
    waitbar(i/length(movies))
    load(movies{i})
    for i2=1:6
        N(i,i2)=IntensityNormalization(Threshfxyc,i2);
    end
end
close(h)

%%

Nscale=N./median(N);
figure
notBoxPlot(Nscale)
SDs=std(Nscale);
figure
bar(SDs)

%%
Nscale=log(N);
figure
notBoxPlot(Nscale)
SDs=std(Nscale);
figure
bar(SDs)

%%

clear
load('190116_NewScopeMoviesCell.mat')
h=waitbar(0,'~');
for i=1:length(movies)
    waitbar(i/length(movies))
    load(movies{i})
    for i2=5:5:95
        N(i,i2/5)=IntensityNormalization(Threshfxyc,4,i2);
    end
end
close(h)

%%
ps=(5:5:95);
%Nscale=N./median(N);
Nscale=log(N);
figure
notBoxPlot(N)
SDs=std(Nscale);
figure
bar(ps,SDs)