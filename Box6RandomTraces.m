function Data=Box6RandomTraces(MSD,MasterMovie,SlaveMovie,BoxMasterMovie,BoxSlaveMovie)

for i=1:6
    r(i)=ceil(rand*length(MSD));
    Data{i}=MSD{r(i)};
end
Data{7}=r;
F=length(imfinfo(MasterMovie));
h=waitbar(0,'Boxing 6 Traces');
for i=1:F
    waitbar(i/F)
    IMm=imread(MasterMovie,'Index',i);
    IMs=imread(SlaveMovie,'Index',i);
    Pos=[];
    for i2=1:6
        used=find(Data{i2}(:,1)==i);
        if ~isempty(used)
            Pos=[Pos;[Data{i2}(used(1),2) Data{i2}(used(1),3) i2]];
        end
    end
    [IMm,IMs]=BoxSpots(Pos,IMm,IMs);
    imwrite(IMm,BoxMasterMovie,'Writemode','append','Compression','none')
    imwrite(IMs,BoxSlaveMovie,'Writemode','append','Compression','none')
end
close(h)