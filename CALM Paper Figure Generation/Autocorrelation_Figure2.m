clear all
Name560='Clathrin';
nbins=50;

for i0=1:4
    XL=[];
    YL=[];
    frame=1;
    
    switch i0
        case 1
            folder='Z:\Scott\TIRF SIM\Control AP2 Clathrin';
            Name488='AP2';
            Inds=[9 11]; %AP2 Plaque
            frame=7;
            XL=[10 32];
            YL=[1 23];
        case 2
            folder='Z:\Scott\TIRF SIM\Control AP2 Clathrin';
            Name488='AP2';
            Inds=[5 6]; %Pit
            XL=[8 30];
            YL=[10 32];
        case 3
            folder='Z:\Scott\TIRF SIM\Control CALM Clathrin';
            Name488='CALM';
            Inds=[7 8]; %Pit
            XL=[8 30];
            YL=[5 27];
        case 4
            folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 3';
            Name488='CALM';
            %CALM Plaque for figure!
            Inds=[3 4];
            XL=[7 29];
            YL=[7 29];
            frame=1;
    end
    files=FindFiles(folder,'*.tif').';
    figure('units','normalized','outerposition',[0 0 .5 .65])
    IMG{1}=double(imread(files{Inds(1)},'Index',frame));
    IMG{2}=double(imread(files{Inds(2)},'Index',frame));
    [shift_x,shift_y,DM,SIM{1},SIM{2}]=AlignAndMaxXCorr(IMG{1},IMG{2},0);
    
    for i=1:length(Inds)
        if i==1
            Col='g';
        else
            Col='r';
        end
        IM=SIM{i};
        subplot(2,3,(i-1)*3+1)
        M{(i-1)*2+1}=IM;
        imshow(IM,[0 max(max(IM))],'InitialMagnification','fit')
        if ~isempty(XL)
            xlim(XL)
            ylim(YL)
        end
        %xlim([10 32])
        title(strcat('Original Image'),'fontsize',12)
        [AC,SmallAC]=Autocorrellation(IM,12);
        subplot(2,3,(i-1)*3+2)
        M{(i-1)*2+2}=SmallAC;
        imshow(SmallAC,[0 max(max(SmallAC))],'InitialMagnification','fit')
        title('Autocorrelation Image','fontsize',12)
        subplot(2,3,(i-1)*3+3)
        [xs,ys]=RadialDistancePlot(SmallAC);
        ys=ys/max(ys);
        plot(xs,ys,Col)
        hold on
        xq=0:max(xs);
        yi=interp1(xs,ys,xq);
        [xL,xR]=FindFWHMBoundaries(yi,0);
        FWHMx{i}=strcat('FWHM = ',num2str((xR-1)*80),' nm');
        line([0 xR-1],[.5+(i-1)*.01 .5+(i-1)*.01],'Color',Col,'LineStyle','--')
        xlim([0 15])
        xlabel('Pixel (40nm spacing)','fontsize',12)
        ylabel('Radial Average of Autocorrelation','fontsize',12)
    end
    subplot(2,3,1)
    ylabel(strcat(Name488,' Channel'),'fontsize',12)
    subplot(2,3,4)
    ylabel(strcat(Name560,' Channel'),'fontsize',12)
    subplot(2,3,3)
    title(FWHMx{1})
    subplot(2,3,6)
    title(FWHMx{2})
end

