clear all
Name488='CALM';
Name560='Clathrin';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\488 Beads 170nm';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';
nbins=50;
% folder='Z:\Scott\TIRF SIM\Control AP2 Clathrin 2';
% Inds=[11 12]; %Plaque
% folder='Z:\Scott\TIRF SIM\Control AP2 Clathrin 2';
% Inds=[1 2]; %Pit
% folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 2';
% Inds=[11 12]; %Plaque
% folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 2';
% Inds=[7 8]; %Pit
% folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 3';
% Inds=[1 2];
%folder='Z:\Scott\TIRF SIM\Control SIM Movies\AP2\0329_W1_103046';
%Inds=[1 2];
folder='E:\CME Superfolder\CME Data\FakeTIRFSIM\Crops';
Inds=[1 2]; %Fake TIRF-SIM Plaque
Inds=[11 12]; %Fake TIRF-SIM Plaque
Inds=[17 18]; %Real TIRF-SIM Plaque
%Inds=[7 8]; %Fake TIRF-SIM Pit
files=FindFiles(folder,'*.tif').';

FSFig
IMG{1}=double(imread(files{Inds(1)},'Index',1));
IMG{2}=double(imread(files{Inds(2)},'Index',1));
[shift_x,shift_y,DM,SIM{1},SIM{2}]=AlignAndMaxXCorr(IMG{1},IMG{2},0);
for i=1:length(Inds)
    if i==1
        Col='g';
    else
        Col='r';
    end
    %IM=imread(files{Inds(i)},'Index',1);
    IM=SIM{i};
    subplot(length(Inds),3,(i-1)*3+1)
    imshow(IM,[0 max(max(IM))])
    %colorbar
    title(strcat('Original Image'),'fontsize',24)
    [AC,SmallAC]=Autocorrellation(IM,20);
    subplot(length(Inds),3,(i-1)*3+2)
    imshow(SmallAC,[0 max(max(SmallAC))])
    %colorbar
    title('Autocorrelation Image','fontsize',24)
    subplot(length(Inds),3,3)
    [xs,ys]=RadialDistancePlot(SmallAC,nbins);
    ys=ys/max(ys); %(ys-min(ys))/(max(ys)-min(ys));
    plot(xs,ys,Col)
    %plot(max(SmallAC,[],1)/max(max(SmallAC)),Col)
    hold on
    xq=0:max(xs);
    yi=interp1(xs,ys,xq);
    [xL,xR]=FindFWHMBoundaries(yi,0);
    FWHMx{i}=strcat('FWHM = ',num2str((xR-1)*80),' nm');
    line([0 xR-1],[.5+(i-1)*.01 .5+(i-1)*.01],'Color',Col,'LineStyle','--')
    
    xlabel('Pixel (40nm spacing)','fontsize',18)
    title('Radial Average of Autocorrelation','fontsize',18)
    subplot(length(Inds),3,6)
    plot(max(SmallAC,[],2)/max(max(SmallAC)),Col)
    hold on
    [xL,xR]=FindFWHMBoundaries(max(SmallAC,[],2)/max(max(SmallAC)),0);
    FWHMy{i}=strcat('FWHM = ',num2str((xR-xL)*40),' nm');
    line([xL xR],[.5 .5],'Color',Col,'LineStyle','--')
    
    xlabel('Pixel (40nm spacing)')
    title('Y Max Projection of Autocorrelation')
end
subplot(2,3,1)
ylabel(strcat(Name488,' Channel'),'fontsize',24)
subplot(2,3,4)
ylabel(strcat(Name560,' Channel'),'fontsize',24)
subplot(2,3,3)
legend({Name488,FWHMx{1},Name560,FWHMx{2}},'fontsize',16)
subplot(2,3,6)
legend(Name488,FWHMy{1},Name560,FWHMy{2})