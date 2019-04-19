NpointsPerArea=.1;
FlatGrowthT=32;
CurvatureT=32;
FinalRadius=50;
TIRFDecayL=50;
PixelWidth=30;
ImWidth=FinalRadius/PixelWidth*6;
figure
for i=1:FlatGrowthT
    Area=4*pi*FinalRadius^2/FlatGrowthT*i;
    Radius=sqrt(Area/pi);
    %Radius=2*FinalRadius/FlatGrowthT*i;
    Npoints=ceil(NpointsPerArea*pi*Radius^2);
    Pos=zeros(Npoints,3);
    for i2=1:Npoints
        Pos(i2,:)=[RandomCirclePoint(Radius) 0];
    end
    subplot(8,8,i)
    IM{i}=Points2Image(Pos,ImWidth,TIRFDecayL,PixelWidth);
    imagesc(IM{i})
%     scatter(Pos(:,1),Pos(:,2))
%     xlim([-50 50])
%     ylim([-50 50])
end
for i=1:CurvatureT
    [SRadius(i),maxphi(i)]=CalculateSphereParameters(FinalRadius,i/CurvatureT);
    Pos=zeros(Npoints,3);
    for i2=1:Npoints
        Pos(i2,:)=RandomPartialSpherePoint(SRadius(i),maxphi(i));
    end
    Pos(:,3)=Pos(:,3)-min(Pos(:,3));
    subplot(8,8,i+FlatGrowthT)
    %scatter3(Pos(:,1),Pos(:,2),Pos(:,3))
    IM{i+FlatGrowthT}=Points2Image(Pos,ImWidth,TIRFDecayL,PixelWidth);
    imagesc(IM{i+FlatGrowthT})
end
figure
Quilt=QuiltImages(IM,1);
imshow(Quilt,[0 max(max(Quilt))])
figure
middle=ceil(ImWidth/2);
K=Kymograph(IM,[middle middle],[0 ImWidth]);
imshow(K,[0 max(max(K))])