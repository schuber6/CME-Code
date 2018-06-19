clear sxswt syswt Hwt Hsi
figure
for i=1:length(DataWT)
    file=DataWT(i).file;
    fileR=DataWT(i).movieR;
    fileG=DataWT(i).movieG;
    load(file)
    [events,inds]=FirstFrameEvents_FXYCMS(FXYCMS,1);
    [sxswt{i},syswt{i}]=CalculateFramePSFsds(fileR,events,1,3);
    Hwt{i}=hist(max([sxswt{i} ; syswt{i}]),xpos);
    plot(xpos,Hwt{i}/sum(Hwt{i}),'g')
    hold on
end
for i=1:length(DataSI)
    file=DataSI(i).file;
    fileR=DataSI(i).movieR;
    fileG=DataSI(i).movieG;
    load(file)
    [events,inds]=FirstFrameEvents_FXYCMS(FXYCMS,1);
    [sxssi{i},syssi{i}]=CalculateFramePSFsds(fileR,events,1,3);
    Hsi{i}=hist(max([sxssi{i} ; syssi{i}]),xpos);
    plot(xpos,Hsi{i}/sum(Hsi{i}),'r')
    hold on
end
