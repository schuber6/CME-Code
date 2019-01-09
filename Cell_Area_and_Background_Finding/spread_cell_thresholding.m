function [masks, Thresh] = spread_cell_thresholding(filename)
%%
global k
if nargin < 1
    input('What is the filename (including extension) of the membrane surface color? ',filename);
elseif nargin == 1
    if ~ischar(filename)
        error('Input must be filename in single quotes (must be a string).');
    end
else
    error('Too many inputs.')
end
%%
gaus = fspecial('gaussian', 5, 1.5);
flat = ones(3)/9;
ss = imread(filename);
s = size(ss);
stacks = length(imfinfo(filename));
masks = zeros(s(1),s(2),stacks,'double');
J = zeros(s(1),s(2),stacks,'uint16');
IMG = zeros(s(1),s(2),stacks,'double');
for j=1:stacks
    IMG(:,:,j) = imread(filename,'Index',j);
    J(:,:,j) = imfilter(IMG(:,:,j),gaus); %first gaussian filter
    J(:,:,j) = imfilter(IMG(:,:,j),flat); %then avg
end
SHOW1 = J(:,:,1);
%%
k = 0;
while k ~= 1
    if k ~= 3
        figure('units','normalized','outerposition',[0 0 1 1]);
        [y,x] = histcounts(double(SHOW1(:)),100); %makes a historgram of intensities
        x = (x(1:end-1)+x(2:end))/2;
        plot(x,y);
        axis tight;
        if k == 2, line([Thresh Thresh], [0 max(y)], 'Color', 'k'); end %allows an easier second guess
        title('Try an x pos after first peak.');
        [Thresh,~] = ginput(1);
        close(gcf);
        figure('units','normalized','outerposition',[0 0 1 1]);
        colormap('gray');
        ah = tight_subplot(5,5,.005,[0 0],[0 0]);
    else
        figure('units','normalized','outerposition',[0 0 1 1]);
        colormap('gray');
        ah = tight_subplot(5,5,.005,[0 0],[0 0]);
    end
    
    for i = 1:25
        idum = ceil(i*stacks/25);
        axes(ah(i));
        imagesc(J(:,:,idum));
        hold on; %draw the boundaries on top of the image
        [bx,by] = thresholding(J(:,:,idum),Thresh); %see fcn at end
        if k == 3
            [~,biggest] = max(cellfun(@length,bx));
            plot(bx{biggest},by{biggest},'r')
            axis off
        else
            for j = 1:length(bx)
                plot(bx{j},by{j},'r');
                hold on
            end
        end
        axis off
    end
    hold off;
    pastk = k;
%     d = dialog(...
%         'Units','normalized',...
%         'Position',[.3 .3 .3 .3],...
%         'Name','Menu');
%     uicontrol(...
%         'Parent',d,...
%         'Units','Normalized',...
%         'Position',[.3 .8 .3 .15],...
%         'Style','pushbutton',...
%         'String','Yes',...
%         'Callback',@setk1);
%     uicontrol(...
%         'Parent',d,...
%         'Units','Normalized',...
%         'Position',[.3 .6 .3 .15],...
%         'Style','pushbutton',...
%         'String','No',...
%         'Callback',@setk2);
%     uicontrol(...
%         'Parent',d,...
%         'Units','Normalized',...
%         'Position',[.3 .4 .3 .15],...
%         'Style','pushbutton',...
%         'String','Only biggest',...
%         'Callback',@setk3);
%     uicontrol(...
%         'Parent',d,...
%         'Units','Normalized',...
%         'Position',[.3 .2 .3 .15],...
%         'Style','pushbutton',...
%         'String','Exit',...
%         'Callback',@setk4);
%     waitfor(d)
        
%     k = menu('Do you want to keep this?','Yes','No','Only biggest','Exit');
%     close(gcf);
k=input('Keep? (1=Yes, 2=No, 3=Only Biggest, 4=Exit)');
close(gcf);

    if k == 4, close; return; end
end
%%
for i = 1:stacks
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
%     function setk1()
%         k = 1;
%         close(gcf);
%     end
%     function setk2
%         k = 2;
%         close(gcf);
%     end
%     function setk3
%         k = 3;
%         close(gcf);
%     end
%     function setk4
%         k = 4;
%         close(gcf);
%     end
end