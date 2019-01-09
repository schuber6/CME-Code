T=59;
%for i=2:7
    T=BT(12);
    fxy=FXYCMS{T}(:,1:3);
    movieG='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_AP2.tif';
    movieR='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_CLCa.tif';
    %file='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_AP2.tif';
    Kym=KymographTrace_WithBlueBar(fxy,movieG,movieR,T,5,'sum',60);
%end
%figure
%    h=pcolor(Kym);
%    set(h, 'EdgeColor', 'none');