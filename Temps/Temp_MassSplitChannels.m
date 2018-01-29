% exp_name='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells';
% [paths,movies]=FindFiles_Full(exp_name,'*osmo_singlestacks*');
% h=waitbar(0,'asdf');
% for i=1:length(movies)
%     waitbar(i/length(movies))
%     oddnew=strcat(exp_name,'\Split Channels\',movies{i}(1:end-4),'_AP2.tif');
%     evennew=strcat(exp_name,'\Split Channels\',movies{i}(1:end-4),'_CLCa.tif');
%     SplitChannels(paths{i},oddnew,evennew)
% end
% close(h)
exp_name='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells\Split Channels';
[paths,movies]=FindFiles_Full(exp_name,'*osmo_singlestacks*');
for i=1:length(movies)
    waitbar(i/length(movies))
    SplitIntoSingleStackRepeatMovies(paths{i},5)
end
