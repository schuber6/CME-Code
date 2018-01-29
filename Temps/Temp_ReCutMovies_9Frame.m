movies{1}='E:\CME Superfolder\CME Data\170420_SUM_Osmoshock80_BS\orig_movies\control001_BS.tif';
movies{2}='E:\CME Superfolder\CME Data\170420_SUM_Osmoshock80_BS\orig_movies\control002_BS.tif';
for i0=1:2
    Old=movies{i0};
    F=length(imfinfo(Old));
    for iF=1:F-8
        if (iF-1)/5==ceil((iF-1)/5)
            New=strcat(Old(1:end-4),num2str(iF),'_9Frame.tif');
            for i=iF:iF+8
                
                A=imread(Old,'Index',i);
                
                imwrite(A,New,'Writemode','append','Compression','none')
            end
        end
    end
end