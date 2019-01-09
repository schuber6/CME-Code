i0=1;    
i=6;
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\ZStacks';
files=FindFiles(folder,'*Green.tif');
        IM=imread(files{i0},'Index',i);
        masksbool=imfill(Masks{i0}(:,:,i)>0,'holes');
        %Area(i0,i-min(frames)+1)=sum(sum(double(masksbool)))*.16^2;
        masked=masksbool.*(double(IM)+1);
        vect=masked(:);
        
figure
subplot(1,2,1)
hist(vect,0:10:1000)
xlim([10 990])
prctile(nonzeros(vect),10:10:90)
Invmasksbool=~masksbool;
        Invmasked=Invmasksbool.*(double(IM)+1);
        vect=Invmasked(:);
        median(nonzeros(vect))
        subplot(1,2,2)
hist(vect,0:10:1000)
xlim([10 990])
