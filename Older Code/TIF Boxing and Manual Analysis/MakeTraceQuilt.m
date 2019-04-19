function Scale = MakeTraceQuilt(movie,trace)

IM=imread(movie,'Index',1);
Rad=15;
RadG=0;
[a,b]=size(IM);
XMin=round(min(trace(:,2)));
XMax=round(max(trace(:,2)));
YMin=round(min(trace(:,3)));
YMax=round(max(trace(:,3)));
WYMi=max(YMin-Rad,1);
WYMa=min(YMax+Rad,a);
WXMi=max(XMin-Rad,1);
WXMa=min(XMax+Rad,b);
frames=trace(:,1);
PosX=round(trace(:,2));
PosY=round(trace(:,3));
MF=length(imfinfo(movie));
if frames(end)~=MF
    frames=[frames ; frames(end)+1];
    PosX=[PosX ; PosX(end)];
    PosY=[PosY ; PosY(end)];
end
if frames(1)~=1
    frames=[frames(1)-1 ; frames];
    PosX=[PosX(1) ; PosX];
    PosY=[PosY(1) ; PosY];
end

for i=1:length(frames)
    IM=imread(movie,'Index',frames(i));
    Crop{i}(:,:,1)=IM(WYMi:WYMa,WXMi:WXMa);
    Crop{i}(:,:,2)=IM(WYMi:WYMa,WXMi:WXMa);
    Crop{i}(:,:,3)=IM(WYMi:WYMa,WXMi:WXMa);
    M=max(max(Crop{i}(:,:,1)));
    CG=zeros(size(Crop{i}));
    for i2=PosY(i)-RadG:PosY(i)+RadG
        for i3=PosX(i)-RadG:PosX(i)+RadG
            CG(i2-(YMin-Rad)+1,i3-(XMin-Rad)+1,1)=-M;
            CG(i2-(YMin-Rad)+1,i3-(XMin-Rad)+1,2)=IM(i2,i3);
            CG(i2-(YMin-Rad)+1,i3-(XMin-Rad)+1,3)=IM(i2,i3);
        end
    end
    Crop{i}=double(Crop{i})-CG;
end
Crop=QuiltImagesRGB(Crop,1,4);
subplot(2,1,1)
C=double(Crop);
NC=nonzeros(C);
Scale=(C-min(min(min(NC))))/(max(max(max(NC)))-min(min(min(NC))));