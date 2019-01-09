folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells';

movie='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells\osmo_singlestacks001_BS_Cell1.tif';
newmovie='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells\FP_DualColor_Offset\oss001_C1.tif';

for i=1:9
    clear B
    IMg=imread(movie,'Index',(i-1)*10+5);
    IMr=imread(movie,'Index',(i-1)*10+6);
    [A,B]=size(IMr);
    IMr=[zeros(A,6) IMr];
    IMg=[IMg zeros(A,6)];
    [A,B]=size(IMr);
    
    C(:,:,1)=IMr(:,:);
    C(:,:,2)=IMg(:,:);
    C(:,:,3)=zeros(A,B);
    imwrite(C,newmovie,'Writemode','append','Compression','none')
end