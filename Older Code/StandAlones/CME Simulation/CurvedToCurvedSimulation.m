NpointsPerArea=.1;
TotalT=64;
FinalRadius=50;
TIRFDecayL=50;
PixelWidth=30;
ImWidth=FinalRadius/PixelWidth*6;
figure
for i=1:TotalT
    Area=4*pi*FinalRadius^2/TotalT*i;
    maxphi(i)=CalculateSphereParameters_ConstantCurvature(FinalRadius,Area);
    Npoints=ceil(NpointsPerArea*Area);
    Pos=zeros(Npoints,3);
    for i2=1:Npoints
        Pos(i2,:)=RandomPartialSpherePoint(FinalRadius,maxphi(i));
    end
    Pos(:,3)=Pos(:,3)-min(Pos(:,3));
    subplot(8,8,i)
    scatter3(Pos(:,1),Pos(:,2),Pos(:,3))
    IM{i}=Points2Image(Pos,ImWidth,TIRFDecayL,PixelWidth);
    %imagesc(IM{i+FlatGrowthT})
end
figure
Quilt=QuiltImages(IM,1);
imshow(Quilt,[0 max(max(Quilt))])
figure
middle=ceil(ImWidth/2);
K=Kymograph(IM,[middle middle],[0 ImWidth]);
imshow(K,[0 max(max(K))])

