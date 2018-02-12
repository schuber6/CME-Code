exp_name='E:\CME Superfolder\CME Data\180208_AP2CLCa_Data\Full\Isolated Cells'; %This part splits the movies into channels
[paths,movies]=FindFiles_Full(exp_name,'*singlestack*');
h=waitbar(0,'asdf');
for i=1:length(movies)
    waitbar(i/length(movies))
    oddnew=strcat(exp_name,'\Split Channels\',movies{i}(1:end-4),'_CLCa.tif');
    evennew=strcat(exp_name,'\Split Channels\',movies{i}(1:end-4),'_AP2.tif');
    SplitChannels(paths{i},oddnew,evennew)
end
% close(h)
% exp_name='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells\Split Channels';
% [paths,movies]=FindFiles_Full(exp_name,'*osmo_singlestacks*');
% for i=1:length(movies)
%     waitbar(i/length(movies))
%     SplitIntoSingleStackRepeatMovies(paths{i},5)
% end

exp_name='E:\CME Superfolder\CME Data\180208_AP2CLCa_Data\Full\Isolated Cells\Split Channels'; %This part splits the movies into stack repeats
[paths,movies]=FindFiles_Full(exp_name,'*singlestack*');
for i=1:length(movies)
    waitbar(i/length(movies))
    SplitIntoSingleStackRepeatMovies(paths{i},5)
end

