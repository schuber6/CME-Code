folder='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\BS\First5';
files=FindFiles(folder,'*FXYCMS*').';
filesR=FindFiles(folder,'*Red.tif');
filesG=FindFiles(folder,'*Green.tif');

i0=12;
    load(files{i0})
    [events,inds,MI,SI,CE,CI,CMI,CSI]=FirstFrameEvents_FXYCMS(FXYCMS,1);
    [sx{i0},sy{i0}]=CalculateFramePSFsds(filesR{i0},events,1,3);
    Msd=max(sx{i0},sy{i0});
    Pl=find(MI>1000 & Msd>1.25);
    Pi=find(MI>1000 & Msd<=1.25);
%     Data(i0).Plaques=inds(find(MI>1000 & Msd>1.25));
%     Data(i0).Pits=inds(find(MI>1000 & Msd<=1.25));
    Cr=find(CMI>1000);
%     Data(i0).Crowded=CI(find(CMI>1000));
%     [Data(i0).Cyt,Data(i0).Back,Data(i0).Area]=CytosolicBackground_SingleFile(filesG{i0},FXYCMS);









fileBox=strcat(filesR{i0}(1:end-4),'Box.tif');
Eg=[];
Cs=[];
for i=1:length(Pl)
    Eg=[Eg ; events(Pl(i),:)];
    Cs=[Cs ; [1 0 0]];
end
for i=1:length(Pi)
    Eg=[Eg ; events(Pi(i),:)];
    Cs=[Cs ; [0 1 0]];
end
for i=1:length(Cr)
    Eg=[Eg ; CE(Cr(i),:)];
    Cs=[Cs ; [0 0 1]];
end
BoxEventsColors(filesG{i0},fileBox,Eg,Cs);
