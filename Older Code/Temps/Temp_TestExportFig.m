J=imread(movie,'Index',31);
masksub=masks(:,:,31)-masks(:,:,30);
imagesc(J);
hold on; %draw the boundaries on top of the image
[bx,by,mask_sb] = thresholding(masksub,.1);
for j = 1:length(bx)
    plot(bx{j},by{j},'r');
    hold on
end

export_fig('TestExportFig3.tif','-append');

J=imread(movie,'Index',32);
masksub=masks(:,:,32)-masks(:,:,31);
imagesc(J);
hold on; %draw the boundaries on top of the image
[bx,by,mask_sb] = thresholding(masksub,.1);
for j = 1:length(bx)
    plot(bx{j},by{j},'r');
    hold on
end

export_fig('TestExportFig3.tif','-append');