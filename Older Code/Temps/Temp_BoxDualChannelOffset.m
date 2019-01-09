movie='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower\Isolated Cells\FP_DualColor_Offset\oss001_C1.tif';
newmovie=strcat(movie(1:end-4),'BoxesRand1.tif');
Nfolder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
Nreg='*aosmo_singlestacks001_BS_Cell1*ZGauss*';
files=FindFiles(Nfolder,Nreg).';
events=[];
inds=[];
for i=1:length(files)
    load(files{i})
    usedC=SelectReasonableZGaussFits(NSTAms);
    for i2=1:length(NSTAms)
        if ~isempty(usedC{i2})
            x=NSTAms(i2).xpos(1);
            y=NSTAms(i2).ypos(1);
            events=[events ; [i x y]];
            inds=[inds i2];
        end
    end
end
eventsr=[];
Cs=[];
R=4;
colors = distinguishable_colors(R,'k');
for i=1:length(files)
    load(files{i})
    cands=find(events(:,1)==i);
    for i2=1:R
        T=ceil(rand*length(cands));
        eventsr=[eventsr ; events(cands(T),:)];
        RandNSTA{i}(i2)=NSTAms(inds(cands(T)));
        Cs=[Cs ; colors(i2,:)];
    end
    
end
BoxEventsColors_RGB(movie,newmovie,eventsr,Cs)