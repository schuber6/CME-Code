clear
Thresh1=349.1;



movie='E:\CME Superfolder\CME Data\170127_NewBSC_squish_fullstack\FullTIFs\001_BS.tif';
[SA,V] = spread_cell_thresholding_ByStack(movie,45,Thresh1);
save 170127_001BS_DTdata.mat
clear

Thresh2=331.8;
movie='E:\CME Superfolder\CME Data\170127_NewBSC_squish_fullstack\FullTIFs\002_BS.tif';
[SA,V] = spread_cell_thresholding_ByStack(movie,42,Thresh2);
save 170127_002BS_DTdata.mat
clear

Thresh3=174.2;
movie='E:\CME Superfolder\CME Data\170129_BSC_squish_fullstack\FullTIFs\002_BS.tif';
[SA,V] = spread_cell_thresholding_ByStack(movie,49,Thresh3);
save 170129_002BS_DTdata.mat
clear

Thresh4=196.3;
movie='E:\CME Superfolder\CME Data\170129_BSC_squish_fullstack\FullTIFs\007_BS.tif';
[SA,V] = spread_cell_thresholding_ByStack(movie,35,Thresh4);
save 170129_007BS_DTdata.mat