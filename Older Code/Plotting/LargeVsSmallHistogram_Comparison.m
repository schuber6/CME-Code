clear all
load('DataWT_SI.mat')

% file=DataSI(3).file;
% fileR=DataSI(3).movieR;
% fileG=DataSI(3).movieG;
for i0=1:4
file=DataWT(i0).file;
fileR=DataWT(i0).movieR;
fileG=DataWT(i0).movieG;
load(file)
[events,inds]=FirstFrameEvents_FXYCMS(FXYCMS,1);
[sxswt,syswt]=CalculateFramePSFsds(fileR,events,1,3);
[sxswtG,syswtG]=CalculateFramePSFsds(fileG,events,1,3);

MIs_Small=[];
SIs_Small=[];
MIs_Large=[];
SIs_Large=[];
LTs_Large=[];
LTs_Small=[];

for i=1:length(FXYCMS)
    I=find(inds==i);
    if isempty(I)
        V(i)=0;
        Vg(i)=0;
    else
        V(i)=max([sxswt(I) syswt(I)]);
        Vg(i)=max([sxswtG(I) syswtG(I)]);
    end
    if ~isempty(I)
        fxyc=FXYCMS{i};
        if V(i)>1.25
            MIs_Large=[MIs_Large fxyc(1,6)];
            SIs_Large=[SIs_Large fxyc(1,7)];
            LTs_Large=[LTs_Large length(fxyc(:,7))];
        else
            MIs_Small=[MIs_Small fxyc(1,6)];
            SIs_Small=[SIs_Small fxyc(1,7)];
            LTs_Small=[LTs_Small length(fxyc(:,7))];
        end
    end
end
figure
subplot(1,3,1)
DualHistogram([MIs_Small MIs_Large],MIs_Small,10);
subplot(1,3,2)
DualHistogram([SIs_Small SIs_Large],SIs_Small,10);
subplot(1,3,3)
DualHistogram(LTs_Large,LTs_Small,10);
WTvar_Small(i0)=sqrt(var(MIs_Small))/mean(MIs_Small);
end
for i0=1:4
file=DataSI(i0).file;
fileR=DataSI(i0).movieR;
fileG=DataSI(i0).movieG;
load(file)
[events,inds]=FirstFrameEvents_FXYCMS(FXYCMS,1);
[sxswt,syswt]=CalculateFramePSFsds(fileR,events,1,3);
[sxswtG,syswtG]=CalculateFramePSFsds(fileG,events,1,3);

MIs_Small=[];
SIs_Small=[];
MIs_Large=[];
SIs_Large=[];
LTs_Large=[];
LTs_Small=[];

for i=1:length(FXYCMS)
    I=find(inds==i);
    if isempty(I)
        V(i)=0;
        Vg(i)=0;
    else
        V(i)=max([sxswt(I) syswt(I)]);
        Vg(i)=max([sxswtG(I) syswtG(I)]);
    end
    if ~isempty(I)
        fxyc=FXYCMS{i};
        if V(i)>1.25
            MIs_Large=[MIs_Large fxyc(1,6)];
            SIs_Large=[SIs_Large fxyc(1,7)];
            LTs_Large=[LTs_Large length(fxyc(:,7))];
        else
            MIs_Small=[MIs_Small fxyc(1,6)];
            SIs_Small=[SIs_Small fxyc(1,7)];
            LTs_Small=[LTs_Small length(fxyc(:,7))];
        end
    end
end
figure
subplot(1,3,1)
DualHistogram([MIs_Small MIs_Large],MIs_Small,10);
subplot(1,3,2)
DualHistogram([SIs_Small SIs_Large],SIs_Small,10);
subplot(1,3,3)
DualHistogram(LTs_Large,LTs_Small,10);
SIvar_Small(i0)=sqrt(var(MIs_Small))/mean(MIs_Small);
end