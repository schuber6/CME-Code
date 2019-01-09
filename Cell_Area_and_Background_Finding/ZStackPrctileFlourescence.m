function [Red_Cyt_BS,Green_Cyt_BS,Area,masks]=ZStackPrctileFlourescence(folder)

%folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\ZStacks';
p=50;
files=FindFiles(folder,'*Red*tif');

frames=[2 3];

for i0=1:length(files)
    NF=length(imfinfo(files{i0}));
    Fg=strcat(files{i0}(1:end-7),'Green.tif');
    if NF==11
        frames=[6 7];
    else
        frames=[2 3];
    end
    [masks{i0}, Thresh(i0)] = spread_cell_thresholding_SomeFrames(files{i0},frames);
    for i=frames
        masksbool=imfill(masks{i0}(:,:,i)>0,'holes');
        Invmasksbool=~masksbool;
        Area(i0,i-min(frames)+1)=sum(sum(double(masksbool)))*.16^2;
        
        gIM=imread(Fg,'Index',i);
        masked=masksbool.*(double(gIM)+1);
        vect=masked(:);
        GCyt(i0,i-min(frames)+1)=prctile((nonzeros(vect))-1,p);
        Invmasked=Invmasksbool.*(double(gIM)+1);
        vect=Invmasked(:);
        GBack(i0,i-min(frames)+1)=median(nonzeros(vect)-1);
        
        
        rIM=imread(files{i0},'Index',i);
        masked=masksbool.*(double(rIM)+1);
        vect=masked(:);
        RCyt(i0,i-min(frames)+1)=prctile((nonzeros(vect))-1,p);
        Invmasked=Invmasksbool.*(double(rIM)+1);
        vect=Invmasked(:);
        RBack(i0,i-min(frames)+1)=median(nonzeros(vect)-1);
    end
    Green_Cyt_BS(i0)=sum(nonzeros(GCyt(i0,:)))-sum(nonzeros(GBack(i0,:)));
    Red_Cyt_BS(i0)=sum(nonzeros(RCyt(i0,:)))-sum(nonzeros(RBack(i0,:)));
end