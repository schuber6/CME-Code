MS=[];
SS=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if length(fxyc(:,1))>=20 && max(fxyc(:,7))>=10000
    MS=[MS ; fxyc(:,6)];
    SS=[SS ; fxyc(:,7)];
    end
end
%used=find(SS>0);
figure
scatter(MS,SS)
hold on
xlabel('Green Channel Intensity')
ylabel('Red Channel Intensity')
AddLinearRegLine_Color_0Intercept(MS.',SS.',[1 0 0])
%%
CutoffG=3000;
clos=find(MS>CutoffG-100 & MS<CutoffG+100);
CutoffR=median(SS(clos));
used=find(MS>=CutoffG & SS>=CutoffR);
uMS=MS(used);
uSS=SS(used);
figure
scatter(uMS,uSS)
hold on
AddLinearRegLine_Color_0Intercept(uMS.',uSS.',[1 0 0])

%%
CutoffG=1000;
CutoffR=0;
figure
for i=1:6
    subplot(2,3,i)
    used=find(MS>=CutoffG & SS>=CutoffR);
    uMS=MS(used);
    uSS=SS(used);
    [slope, rsq]=LinearSlopeandR2_0Intercept(uMS.',uSS.');
    CutoffR=slope*CutoffG;
    scatter(uMS,uSS)
hold on
AddLinearRegLine_Color_0Intercept(uMS.',uSS.',[1 0 0])
end
close
figure
    scatter(uMS,uSS)
hold on
AddLinearRegLine_Color_0Intercept(uMS.',uSS.',[1 0 0])

    

%%
[H,xbins]=hist(uMS,20);
MCell=cell(1,20);
SCell=cell(1,20);
for i=1:length(uMS)
    bin=find(xbins>uMS(i),1,'first');
    if ~isempty(bin)
        MCell{bin}=[MCell{bin} uMS(i)];
        SCell{bin}=[SCell{bin} uSS(i)];
    end
end
figure
StatCell(SCell,'median_notboxplot')
xticklabels(xbins)

%%

wMS=[];
wSS=[];
events=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    for i2=1:length(fxyc(:,1))
        if fxyc(i2,6)>6000 && fxyc(i2,7)<10000
    wMS=[wMS ; fxyc(i2,6)];
    wSS=[wSS ; fxyc(i2,7)];
        events=[events ; [fxyc(i2,1) fxyc(i2,2) fxyc(i2,3)]];
        end
    end
end
file='E:\CME Superfolder\CME Data\180323_NileRed_2ColorBeadBleaching\100p_300ms_each_continuous_TrimmedGreen.tif';
newfile='E:\CME Superfolder\CME Data\180323_NileRed_2ColorBeadBleaching\100p_300ms_each_continuous_TrimmedGreen_Weird.tif';
BoxEvents(file,newfile,events)
file='E:\CME Superfolder\CME Data\180323_NileRed_2ColorBeadBleaching\100p_300ms_each_continuous_TrimmedRed.tif';
newfile='E:\CME Superfolder\CME Data\180323_NileRed_2ColorBeadBleaching\100p_300ms_each_continuous_TrimmedRed_Weird.tif';
BoxEvents(file,newfile,events)

%%

vMS=[];
vSS=[];
events=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    L=length(fxyc(:,1));
    for i2=1:length(fxyc(:,1))
        if fxyc(i2,6)>6000 && fxyc(i2,7)<10000
    wMS=[wMS ; fxyc(i2,6)];
    wSS=[wSS ; fxyc(i2,7)];
        events=[events ; [fxyc(i2,1) fxyc(i2,2) fxyc(i2,3)]];
        end
    end
end