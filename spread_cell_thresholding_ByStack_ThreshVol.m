function [VT,IT] = spread_cell_thresholding_ByStack_ThreshVol(filename,planes)
%%
% if nargin < 1
%     input('What is the filename (including extension) of the membrane surface color? ',filename);
% elseif nargin == 1
%     if ~ischar(filename)
%         error('Input must be filename in single quotes (must be a string).');
%     end
% else
%     error('Too many inputs.')
% end
%%
[~, Thresh0] = spread_cell_thresholding_FirstStack(filename,planes);
[~, ThreshN] = spread_cell_thresholding_LastStack(filename,planes);
Fullstacks=floor(length(imfinfo(filename))/planes);

VT=zeros(1,Fullstacks);
IT=zeros(1,Fullstacks);
h=waitbar(0,'Calculating Surface Areas and Volumes');
IT0=0;
ITN=0;
for i=1:planes
    A=imread(filename,'Index',i);
    IT0=IT0+sum(sum(A));
end
for i=Fullstacks*planes-planes+1:Fullstacks*planes
    A=imread(filename,'Index',i);
    ITN=ITN+sum(sum(A));
end

for i0=1:Fullstacks
    it=0;
    for i=1:planes
        A=imread(filename,'Index',i+(i0-1)*planes);
        it=it+sum(sum(A));
    end
    IT(i0)=it;
    Thresh=(Thresh0-ThreshN)*(IT(i0)-ITN)/(IT0-ITN)+ThreshN;
    
    waitbar(i0/Fullstacks)
    gaus = fspecial('gaussian', 5, 1.5);
    flat = ones(3)/9;
    ss = imread(filename);
    s = size(ss);
    stacks = length(imfinfo(filename));
    HJstacks=planes;
    masks = zeros(s(1),s(2),HJstacks,'double');
    J = zeros(s(1),s(2),HJstacks,'uint16');
    IMG = zeros(s(1),s(2),HJstacks,'double');
    for j=1:HJstacks
        IMG(:,:,j) = imread(filename,'Index',j+(i0-1)*planes);
        J(:,:,j) = imfilter(IMG(:,:,j),gaus); %first gaussian filter
        J(:,:,j) = imfilter(IMG(:,:,j),flat); %then avg
    end
    SHOW1 = J(:,:,floor(HJstacks/3));
    %%  Thresholding part--no longer used
%     k = 0;
%     while k ~= 1
%         if k ~= 3
%             figure('units','normalized','outerposition',[0 0 1 1]);
%             [y,x] = histcounts(double(SHOW1(:)),100); %makes a historgram of intensities
%             x = (x(1:end-1)+x(2:end))/2;
%             plot(x,y);
%             axis tight;
%             if k == 2, line([Thresh Thresh], [0 max(y)], 'Color', 'k'); end %allows an easier second guess
%             title('Try an x pos after first peak.');
%             [Thresh,~] = ginput(1);
%             close(gcf);
%             figure('units','normalized','outerposition',[0 0 1 1]);
%             colormap('gray');
%             ah = tight_subplot(5,5,.005,[0 0],[0 0]);
%         else
%             figure('units','normalized','outerposition',[0 0 1 1]);
%             colormap('gray');
%             ah = tight_subplot(5,5,.005,[0 0],[0 0]);
%         end
%         
%         for i = 1:25
%             idum = ceil(i*HJstacks/25);
%             axes(ah(i));
%             imagesc(J(:,:,idum));
%             hold on; %draw the boundaries on top of the image
%             [bx,by] = thresholding(J(:,:,idum),Thresh); %see fcn at end
%             if k == 3
%                 [~,biggest] = max(cellfun(@length,bx));
%                 plot(bx{biggest},by{biggest},'r')
%                 axis off
%             else
%                 for j = 1:length(bx)
%                     plot(bx{j},by{j},'r');
%                     hold on
%                 end
%             end
%             axis off
%         end
%         hold off;
%         pastk = k;
%         k = menu('Do you want to keep this?','Yes','No','Only biggest','Exit');
%         close(gcf);
%         if k == 4, close; return; end
%     end
    %%
    pastk=3;
    for i = 1:HJstacks
        [bx,by,mask] = thresholding(J(:,:,i),Thresh);
        if ~isempty(mask)
            if pastk == 3
                [~,whch] = max(cellfun(@sum,cellfun(@sum,mask,'UniformOutput',false)));
            else
                whch = 1:length(mask);
            end
            for ind = whch
                masks(:,:,i) = mask{ind} + masks(:,:,i);
                if ind <= length(bx)
                    for j = 1:length(bx{ind})
                        masks(by{ind}(j),bx{ind}(j),i) = .5;
                    end
                end
            end
        end
    end
    VT(i0)=CalculateThreshVolume(masks);
end
close(h)
end