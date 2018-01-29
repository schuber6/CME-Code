file='E:\CME Superfolder\CME Data\Interesting TIFs\lifeact_squish.tif';
new='E:\CME Superfolder\CME Data\Interesting TIFs\lifeact_squish_112s.tif';
h=waitbar(0,'wr');
for i=1:36*112
    waitbar(i/(36*112))
    A=imread(file,'Index',i);
    imwrite(A,new,'Writemode','append','Compression','none')
end
close(h)