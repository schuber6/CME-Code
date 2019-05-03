clear all
close all
nbins=50;
folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 2';
Inds=[20 21];
Frames=1:5;
Xs=[[8 13];[8 12];[16 10];[16 10];[16 10]]+1;
Ys=[[0 16];[0 16];[0 16];[0 16];[0 16]]+1;
files=FindFiles(folder,'*.tif').';
NF=max(Frames)-min(Frames)+1;
[ha, pos] = tight_subplot(3,NF,[.01 .03],[.1 .01],[.06 .01]); 
figure(1)
for i0=1:NF
    IMG{1}=imread(files{Inds(1)},'Index',Frames(i0));
    IMG{2}=imread(files{Inds(2)},'Index',Frames(i0));
    [shift_x(i0),shift_y(i0),DM,SIM{i0}{2},SIM{i0}{1}]=AlignAndMaxXCorr(IMG{1},IMG{2},0);
    clear MP
    for i=1:length(Inds)
        if i==1
            Col='r';
        else
            Col='c';
        end
        axes(ha((i-1)*NF+i0))
        IM=SIM{i0}{i};
        imshow(IM,[0 max(max(IM))])
        hold on
        line(Xs(i0,:),Ys(i0,:),'Color',Col)
        axes(ha(2*NF+i0))
        for i2=-1:1
            MP(i2+2,:)=improfile(IM,Xs(i0,:)+i2,Ys(i0,:));
        end
        MP=mean(MP);
        figure(1)
        plot((MP-min(MP))/(max(MP)-min(MP)),Col)
        hold on
        ylim([0 1])
        xlim([1 length(MP)])
        yticks([])
        xticks([])
        if i0==1 && i==1
            axes(ha(1))
            hold on
            x_location=18;
            y_location=2;
            Scalebar_length=100;
            PixelSize=33.1;
            quiver(x_location,y_location,Scalebar_length/PixelSize,...
            0,'ShowArrowHead','off','Color','w','LineWidth',4)
            text(x_location-1.4,y_location+1.4,'100 nm','Color','w','fontsize',6);
        end
    end
end

axes(ha(NF+1))
ylabel('CALM Channel','Color','c')
axes(ha(1))
ylabel('Clathrin Channel','Color','r')
axes(ha(2*NF+1))
ylabel('Normalized Cross Section')
legend('Clathrin','CALM')