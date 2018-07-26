clear all
Name488='AP2';
Name560='Clathrin';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\488 Beads 170nm';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';
nbins=50;
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin 2';
folder='Z:\Scott\TIRF SIM\Control SIM Movies\AP2\0329_W1_103046';
files=FindFiles(folder,'*.tif').';
Inds=[1 2];
%FSFig
%[ha,pos] = tight_subplot(2,3,[.15 -.02],[.03 .03],[-.02 .01]);
IMG{1}=imread(files{Inds(1)},'Index',1);
IMG{2}=imread(files{Inds(2)},'Index',1);
[shift_x,shift_y,DM,SIM{1},SIM{2}]=AlignAndMaxXCorr(IMG{1},IMG{2},0);
for i=1:length(Inds)
    if i==1
        Col='b';
    else
        Col='r';
    end
    %IM=imread(files{Inds(i)},'Index',1);
    IM=SIM{i};
    %subplot(length(Inds),3,i)
    %   axes(ha(i))
    figure(i)
    imshow(IM,[0 max(max(IM))])

    %colorbar
    %title(strcat('Original Image. XCorr R= ',num2str(DM)))
    [AC,SmallAC]=Autocorrellation(IM,20);
    %subplot(length(Inds),3,(i-1)*3+2)
    %imshow(SmallAC,[0 max(max(SmallAC))])
    %colorbar
    %title('Autocorrelatoin Image')
    %subplot(length(Inds),3,3)
   % axes(ha(3))
    figure(3)
    [xs,ys]=RadialDistancePlot(SmallAC,nbins);
    ys=ys/max(ys); %(ys-min(ys))/(max(ys)-min(ys));
    plot(xs*40,ys,Col)
    %plot(max(SmallAC,[],1)/max(max(SmallAC)),Col)
    hold on
    xq=0:max(xs);
    yi=interp1(xs,ys,xq);
    [xL,xR]=FindFWHMBoundaries(yi,0);
    FWHMx{i}=strcat('FWHM = ',num2str((xR-1)*80),' nm');
    line([0 xR-1]*40,[.5+(i-1)*.01 .5+(i-1)*.01],'Color',Col,'LineStyle','--')
    
    xlabel('Distance from Center (nm)')
    title('Radial Average of Autocorrelation')
    %subplot(length(Inds),3,6)
    %plot(max(SmallAC,[],2)/max(max(SmallAC)),Col)
    %hold on
    %[xL,xR]=FindFWHMBoundaries(max(SmallAC,[],2)/max(max(SmallAC)),0);
    %FWHMy{i}=strcat('FWHM = ',num2str((xR-xL)*40),' nm');
    %line([xL xR],[.5 .5],'Color',Col,'LineStyle','--')
    
    %xlabel('Pixel (40nm spacing)')
    %title('Y Max Projection of Autocorrelation')
end
%subplot(2,3,1)
%axes(ha(1))
figure(1)
title(strcat(Name488,' Channel'),'Color','b')
%subplot(2,3,2)
%axes(ha(2))
figure(2)
title(strcat(Name560,' Channel'),'Color','r')
%subplot(2,3,3)
%axes(ha(3))
figure(3)
legend(Name488,FWHMx{1},Name560,FWHMx{2})
%subplot(2,3,6)
%legend(Name488,FWHMy{1},Name560,FWHMy{2})

Name488='CALM';
Name560='Clathrin';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\488 Beads 170nm';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';
nbins=50;
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin 2';
folder='Z:\Scott\TIRF SIM\Control SIM Movies\CALM\0330_W1_151234';
files=FindFiles(folder,'*.tif').';
Inds=[3 4];
IMG{1}=imread(files{Inds(1)},'Index',1);
IMG{2}=imread(files{Inds(2)},'Index',1);
[shift_x,shift_y,DM,SIM{1},SIM{2}]=AlignAndMaxXCorr(IMG{1},IMG{2},0);
for i=1:length(Inds)
    if i==1
        Col='c';
    else
        Col='r';
    end
    %IM=imread(files{Inds(i)},'Index',1);
    IM=SIM{i};
    %subplot(length(Inds),3,i+3)
   % axes(ha(i+3))
    figure(i+3)
    imshow(IM,[0 max(max(IM))])
    %colorbar
    %title(strcat('Original Image. XCorr R= ',num2str(DM)))
    [AC,SmallAC]=Autocorrellation(IM,20);
    %subplot(length(Inds),3,(i-1)*3+2)
    %imshow(SmallAC,[0 max(max(SmallAC))])
    %colorbar
    %title('Autocorrelatoin Image')
    %subplot(length(Inds),3,6)
    %axes(ha(6))
    figure(6)
    [xs,ys]=RadialDistancePlot(SmallAC,nbins);
    ys=ys/max(ys); %(ys-min(ys))/(max(ys)-min(ys));
    plot(xs*40,ys,Col)
    %plot(max(SmallAC,[],1)/max(max(SmallAC)),Col)
    hold on
    xq=0:max(xs);
    yi=interp1(xs,ys,xq);
    [xL,xR]=FindFWHMBoundaries(yi,0);
    FWHMx{i}=strcat('FWHM = ',num2str((xR-1)*80),' nm');
    line([0 xR-1]*40,[.5+(i-1)*.01 .5+(i-1)*.01],'Color',Col,'LineStyle','--')
    
    xlabel('Distance from Center (nm)')
    title('Radial Average of Autocorrelation')
    %subplot(length(Inds),3,6)
    %plot(max(SmallAC,[],2)/max(max(SmallAC)),Col)
    %hold on
    %[xL,xR]=FindFWHMBoundaries(max(SmallAC,[],2)/max(max(SmallAC)),0);
    %FWHMy{i}=strcat('FWHM = ',num2str((xR-xL)*40),' nm');
    %line([xL xR],[.5 .5],'Color',Col,'LineStyle','--')
    
    %xlabel('Pixel (40nm spacing)')
    %title('Y Max Projection of Autocorrelation')
end
%subplot(2,3,4)
%axes(ha(4))
figure(4)
title(strcat(Name488,' Channel'),'Color','c')
%subplot(2,3,2)
%axes(ha(5))
figure(5)
title(strcat(Name560,' Channel'),'Color','r')
%subplot(2,3,6)
%axes(ha(6))
figure(6)
legend(Name488,FWHMx{1},Name560,FWHMx{2})