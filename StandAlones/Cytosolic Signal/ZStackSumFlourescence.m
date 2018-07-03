function [Cyt_BS,Area,Cyt,Back,Thresh]=ZStackSumFlourescence(folder)

%folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\ZStacks';
files=FindFiles(folder,'*Green*tif');

%frames=[2 3];

for i0=1:length(files)
    NF=length(imfinfo(files{i0}));
    if NF==11
        frames=[6 7];
    else
        frames=[2 3];
    end
    [masks, Thresh(i0)] = spread_cell_thresholding_SomeFrames(files{i0},frames);
    for i=frames
        IM=imread(files{i0},'Index',i);
        masksbool=imfill(masks(:,:,i)>0,'holes');
        Area(i0,i-1)=sum(sum(double(masksbool)))*.16^2;
        masked=masksbool.*(double(IM)+1);
        vect=masked(:);
        Invmasksbool=~masksbool;
        Cyt(i0,i-1)=mean(nonzeros(vect))-1;
        Invmasked=Invmasksbool.*(double(IM)+1);
        vect=Invmasked(:);
        Back(i0,i-1)=mean(nonzeros(vect)-1);
        Cyt_BS(i0)=sum(nonzeros(Cyt(i0,:)))-sum(nonzeros(Back(i0,:)));
    end
end