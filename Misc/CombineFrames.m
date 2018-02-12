exp_name='E:\CME Superfolder\CME Data\170914_SingleGFP';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'020t*'));
name='E:\CME Superfolder\CME Data\170914_SingleGFP\020_Last4000_BS.tif';
Back='E:\CME Superfolder\CME Data\170914_SingleGFP\AVG_100ms_Background.tif';
BG=imread(Back);
h=waitbar(0,'BS');
for i=length(tmpd)-4000:length(tmpd)
    waitbar((i/length(tmpd)))
    movies{i} = fullfile(omd,tmpd(i).name);
    A=imread(movies{i},'Index',1);
    B=A(:,:,1);
    BS=B-BG;
    imwrite(BS,name,'Writemode','append','Compression','none')
end
close(h)