file=DataWT(2).file;
fileR=DataWT(2).movieR;
fileG=DataWT(2).movieG;
load(file)
[events,inds]=FirstFrameEvents_FXYCMS(FXYCMS,1);
[sxswt,syswt]=CalculateFramePSFsds(fileR,events,1,3);

for i=1:length(FXYCMS)
    I=find(inds==i);
    if isempty(I)
        V(i)=0;
    else
        V(i)=max([sxswt(I) syswt(I)]);
    end
end

ManualAnalysis(file,fileR,V)

%%

file=DataSI(3).file;
fileR=DataSI(3).movieR;
fileG=DataSI(3).movieG;
load(file)
[events,inds]=FirstFrameEvents_FXYCMS(FXYCMS,1);
[sxs,sys]=CalculateFramePSFsds(fileR,events,1,3);

for i=1:length(FXYCMS)
    I=find(inds==i);
    if isempty(I)
        V(i)=0;
    else
        V(i)=max([sxs(I) sys(I)]);
    end
end

ManualAnalysis(file,fileR,V)