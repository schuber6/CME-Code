movie='Z:\Scott\donuts_from_nathan\Sim_movie4_2s.tif';
X=610;
Y=250;
r=9;
KyRad=5;
rsmall=4;
frames=40:77;
Kym=zeros(length(frames),2*KyRad+1);
figure
for f=frames
    IM=imread(movie,'Index',f);
    I=f-min(frames)+1;
    crop{I}=double(CropEvent(X,Y,IM,r));
    [Xcom(I),Ycom(I)]=CenterOfIntensity(crop{I});
    for i=1:5
        COMcrop=double(CropEvent_KeepOutside(Xcom(I),Ycom(I),crop{I},rsmall));
        [Xcom(I),Ycom(I)]=CenterOfIntensity(COMcrop);
    end
    subplot(7,7,I)
    imshow(crop{I},[0 max(max(crop{I}))])
    hold on
    scatter(Xcom(I),Ycom(I))
    %[xs,ys]=RadialDistancePlot(crop{I},Ycom(I),Xcom(I));
    Slice=RadialKymographSlice(crop{I},KyRad,Xcom(I),Ycom(I));
%     plot(Slice)
    Kym(I,:)=Slice;
end
figure
Quilt=QuiltImages(crop,1);
imshow(Quilt,[0 max(max(Quilt))])
figure
imshow(Kym,[0 max(max(Kym))])
