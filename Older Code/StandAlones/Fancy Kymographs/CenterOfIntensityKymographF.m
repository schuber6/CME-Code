function CenterOfIntensityKymographF(movie,Xs,Ys,frames)

%movie='Z:\Scott\donuts_from_nathan\Sim_movie4_2s.tif';
dmovie='Z:\Scott\donuts_from_nathan\Sim_movie4_2s_closed.tif';
Xsround=round(Xs);
Ysround=round(Ys);
r=9;
Xscrop=Xs-Xsround+r+1;
Yscrop=Ys-Ysround+r+1;
KyRad=5;
rsmall=4;
XL=[5 15];
Kym=zeros(length(frames),2*KyRad+1);
for f=frames
    IM=imread(movie,'Index',f);
    I=double(f-min(frames)+1);
    crop{I}=double(CropEvent(Xsround(I),Ysround(I),IM,r));
    [Xcom(I),Ycom(I)]=CenterOfIntensity(crop{I});
    for i=1:5
        COMcrop=double(CropEvent_KeepOutside(Xcom(I),Ycom(I),crop{I},rsmall));
        [Xcom(I),Ycom(I)]=CenterOfIntensity(COMcrop);
    end
    DIM=imread(dmovie,'Index',f);
    dcrop{I}=double(CropEvent(Xsround(I),Ysround(I),DIM,r));
    [dXcom(I),dYcom(I)]=CenterOfIntensity(dcrop{I});
    for i=1:5
        COMcrop=double(CropEvent_KeepOutside(dXcom(I),dYcom(I),dcrop{I},rsmall));
        [dXcom(I),dYcom(I)]=CenterOfIntensity(COMcrop);
    end
    SuperSubplot(I)
    imshow(crop{I},[0 max(max(crop{I}))])
    hold on
    scatter(Xcom(I),Ycom(I))
    scatter(Xscrop(I),Yscrop(I))
    scatter(dXcom(I),dYcom(I))
    xlim(XL)
    ylim(XL)
    %[xs,ys]=RadialDistancePlot(crop{I},Ycom(I),Xcom(I));
    Slice=RadialKymographSlice(crop{I},KyRad,Xcom(I),Ycom(I));
    %plot(Slice)
    Kym(I,:)=Slice;
end
figure
subplot(1,2,1)
Quilt=QuiltImages(crop,1);
imshow(Quilt,[0 max(max(Quilt))])
subplot(1,2,2)
imshow(Kym,[0 max(max(Kym))])
% figure
% plot(Kym(:,6),mean(Kym(:,[4,8]),2))
% hold on
% plot(mean(Kym(:,[4,8]),2))