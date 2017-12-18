minbsize=30;
%minbsizeH=50;
minER=100/255;
maxER=200/255;
minS=200/255;
for i=1:473
J0=imread(movie,'Index',i+1);
J(:,:,1)=J0;
J(:,:,2)=J0;
J(:,:,3)=J0;

masksub=masks(:,:,i+1)-masks(:,:,i);
imshow(J0,[min(min(J0)) max(max(J0))])
hold on
plot([1 1],[1 2],'r')
hold on; %draw the boundaries on top of the image
[bx,by,mask_sb] = thresholding(masksub,.1);
S=VerifyStability(bx,by,masks(:,:,i+2));
E=FindFinalEdgeRatios(bx,by,masks(:,:,i+1));
BlebMask(:,:,i)=zeros(size(J0));
NBlebMask(:,:,i)=zeros(size(J0));
ind=1;
for j = 1:length(bx)
    %E=FindFinalEdgeRatios(bx,by,masks(:,:,i+1));
    
    if length(bx{j})>minbsize && E(j)>=minER && E(j)<=maxER && S(j)>=minS
    plot(bx{j},by{j},'r');
    %plot(bx{j},by{j},'Color',[S(j) 0 1-S(j)])
    hold on
    BlebMask(:,:,i)=BlebMask(:,:,i)+mask_sb{j};
    NBlebMask(:,:,i)=NBlebMask(:,:,i)+ind*mask_sb{j};
    ind=ind+1;
%     else
%         if length(bx{j})>minbsize && E(j)>=minER && E(j)<=maxER && S(j)>=minS
%             plot(bx{j},by{j},'b');
%             hold on
%         end
    %else
%         if length(bx{j})<=minbsize
%         plot(bx{j},by{j},'b');
%         hold on
%         else
%            plot(bx{j},by{j},'g');
%            hold on
%         end
    end
end
export_fig('TestExportFig13.tif');
A=imread('TestExportFig13.tif');
imwrite(A,'004_2_25_17_Blebs_minb30_minER100_maxER_200_minS200.tif','Writemode','append','Compression','none');
close all
end