clear all
close all
%folder='E:\CME Superfolder\CME Data\TIRF SIM\488 Beads 170nm';
%folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';
nbins=50;

folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 2';
Inds=[20 21];
Frames=1:5;
Xs=[[8 13];[8 12];[16 10];[16 10];[16 10]]+1;
Ys=[[0 16];[0 16];[0 16];[0 16];[0 16]]+1;

% % folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 2';
% % Inds=[22 23];
% % Frames=5:9;
% % Xs=[[1 26];[10 20];[10 20];[8 19];[7 19]]+1;
% % Ys=[[3 18];[0 21];[0 21];[0 21];[0 21]]+1;

CIM='E:\CME Superfolder\Lines.tif';

folder='Z:\Scott\TIRF SIM\Control CALM Clathrin 4';
Inds=[7 8];
Frames=4:8;
Xs=[[14 7];[18 6];[17 8];[16 10];[16 10]]+1;
Ys=[[0 29];[0 29];[0 29];[0 29];[0 29]]+1;

files=FindFiles(folder,'*.tif').';
NF=max(Frames)-min(Frames)+1;

[ha, pos] = tight_subplot(3,NF,[.01 .03],[.1 .01],[.06 .01]); 

figure(1)
for i0=1:NF
    IMG{1}=imread(files{Inds(1)},'Index',Frames(i0));
    IMG{2}=imread(files{Inds(2)},'Index',Frames(i0));
    %IMG{2}=IMG{2}(3:end,:);
    [shift_x(i0),shift_y(i0),DM,SIM{i0}{1},SIM{i0}{2}]=AlignAndMaxXCorr(IMG{1},IMG{2},0);
    clear MP
    for i=1:length(Inds)
        if i==1
            Col='c';
        else
            Col='r';
        end
        %IM=imread(files{Inds(i)},'Index',1);
        %subplot(3,NF,(i-1)*NF+i0)
        axes(ha((i-1)*NF+i0))
        IM=SIM{i0}{i};
%         imagesc(IM)
%         colormap('gray')
        imshow(IM,[0 max(max(IM))])
        hold on
        line(Xs(i0,:),Ys(i0,:),'Color',Col)
        %subplot(3,NF,NF*2+i0)
        axes(ha(2*NF+i0))
        figure(2)
        for i2=-1:1
            MP(i2+2,:)=improfile(IM,Xs(i0,:)+i2,Ys(i0,:));
        end
        MP=mean(MP);
        %MP=max(MP,[],1);
        figure(1)
        %MP=max(IM,[],2)/max(max(IM));
        plot((MP-min(MP))/(max(MP)-min(MP)),Col)
        hold on
        ylim([0 1])
        yticks([])
        xticks([])
        %imwrite(double(SIM{i0}{1}(1:22,1:28)),CIM,'Writemode','append','Compression','none')
    end
end
% subplot(3,NF,1)
axes(ha(1))
ylabel('CALM Channel')
% subplot(3,NF,NF+1)
axes(ha(NF+1))
ylabel('Clathrin Channel')
% subplot(3,NF,2*NF+1)
axes(ha(2*NF+1))
ylabel('Cross Section')
legend('CALM','Clathrin')