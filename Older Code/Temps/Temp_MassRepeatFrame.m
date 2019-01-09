exp_name='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells\Split Channels';
movies=FindFiles(exp_name,'*osmo_singlestacks*');
h=waitbar(0,'ds');
for i=1:length(movies)
    waitbar(i/length(movies))
    RepeatMovie(movies{i})
end
close(h)