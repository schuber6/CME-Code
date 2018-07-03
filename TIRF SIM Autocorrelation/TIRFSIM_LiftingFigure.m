clear all

%folder='E:\CME Superfolder\CME Data\TIRF SIM\488 Beads 170nm';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';
nbins=50;
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin 2';
folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 4';
files=FindFiles(folder,'*.tif').';
Inds=[7 8];
NF=5;
Frames=4:8;
FSFig
for i0=1:NF
    IMG{1}=imread(files{Inds(1)},'Index',Frames(i0));
    IMG{2}=imread(files{Inds(2)},'Index',Frames(i0));
    %IMG{2}=IMG{2}(3:end,:);
    [shift_x,shift_y,DM,SIM{1},SIM{2}]=AlignAndMaxXCorr(IMG{1},IMG{2},0);
    for i=1:length(Inds)
        if i==1
            Col='g';
        else
            Col='r';
        end
        %IM=imread(files{Inds(i)},'Index',1);
        subplot(3,NF,(i-1)*NF+i0)
        IM=SIM{i};
%         imagesc(IM)
%         colormap('gray')
        imshow(IM,[0 max(max(IM))])
        subplot(3,NF,NF*2+i0)
        MP=max(IM,[],2)/max(max(IM));
        plot(MP,Col)
        hold on
    end
end
subplot(3,NF,1)
ylabel('CALM Channel')
subplot(3,NF,NF+1)
ylabel('Clathrin Channel')
subplot(3,NF,2*NF+1)
ylabel('Y Max Projection')
legend('CALM','Clathrin')