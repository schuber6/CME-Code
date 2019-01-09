clear all
%exp_name='E:\CME Superfolder\CME Data\170907_CALM_CLCa_1StackOsmo';
exp_name='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*BS.tif'));
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    Stacks=length(imfinfo(movies{i})); %Set up to assume 1 stack per file
    SplitIntoSingleStackRepeatMovies(movies{i},Stacks);
end
    