function TraceInspection2(trace,movie,tit)

used=find(trace(:,1));
Fs=trace(used,1);
As=trace(used,5);
%FSFig
figure
subplot(2,2,3)
plot(trace(:,1),trace(:,5))
hold on
plot(Fs,As,'r')
ylabel('Intensity')
xlabel('Frame')
if length(trace(:,1))>1
    for i=1:length(trace(:,1))-1
        D(i)=norm([trace(i+1,2)-trace(i,2) trace(i+1,3)-trace(i,3)]);
    end
    subplot(2,2,4)
    plot(trace(1:end-1,1),D)
    ylabel('Frame Displacment')
    xlabel('Frame')
end

Rad=15;
RadG=0;
[a,b,c]=size(movie);
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
[~,~,MF]=size(movie);
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
    Crop{i}(:,:,1)=movie(WYMi:WYMa,WXMi:WXMa,frames(i));
    Crop{i}(:,:,2)=movie(WYMi:WYMa,WXMi:WXMa,frames(i));
    Crop{i}(:,:,3)=movie(WYMi:WYMa,WXMi:WXMa,frames(i));
    M=max(max(Crop{i}(:,:,1)));
    CG=zeros(size(Crop{i}));
    for i2=PosY(i)-RadG:PosY(i)+RadG
        for i3=PosX(i)-RadG:PosX(i)+RadG
            CG(i2-(YMin-Rad)+1,i3-(XMin-Rad)+1,1)=-M;
            CG(i2-(YMin-Rad)+1,i3-(XMin-Rad)+1,2)=movie(i2,i3,frames(i));
            CG(i2-(YMin-Rad)+1,i3-(XMin-Rad)+1,3)=movie(i2,i3,frames(i));
        end
    end
    Crop{i}=double(Crop{i})-CG;
end
Crop=QuiltImagesRGB(Crop,1,4);
subplot(2,1,1)
C=double(Crop);
NC=nonzeros(C);
Scale=(C-min(min(min(NC))))/(max(max(max(NC)))-min(min(min(NC))));
Z=zeros(size(Scale));
imshow(max(Scale,Z))
title(tit)

%Decision=0;