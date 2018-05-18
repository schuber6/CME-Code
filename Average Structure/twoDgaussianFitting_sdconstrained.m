function c = twoDgaussianFitting_sdconstrained(imgfile,sd)
% c(1) = background
% c(2) = amplitude
% c(3) = x center
% c(4) = y center
% c(5) = theta

if ischar(imgfile)          %can take as input either
img = imread(imgfile);      %name of image file
else                        %or
img = imgfile;              %2D array of image file
end

[ydata, xdata] = meshgrid(1:size(img,2), 1:size(img,1));

%function to fit
F = @(back, amp, x0, y0, th, x, y)back + amp*exp( ...
    -(cos(th)^2/(2*sd^2)+sin(th)^2/(2*sd^2))*(x-x0).^2 ...
    +2*(-sin(2*th)/(4*sd^2) + sin(2*th)/(4*sd^2))*(x-x0).*(y-y0) ...
    -(sin(th)^2/(2*sd^2)+cos(th)^2/(2*sd^2))*(y-y0).^2);

%starting point, upper, and lower bounds of fitting.
c0 =  double([mean(min(img)), max(img(:))-mean(min(img)), ceil(size(img,2)/2), ceil(size(img,1)/2), 0 ]);
low = double([min(img(:)),    mean(img(:))-min(img(:)),   0,                   0,                   0]);
up =  double([mean(img(:)),   max(img(:))-min(img(:)),    size(img,2),         size(img,1),         pi/2]);

xdata = double(xdata); ydata = double(ydata); img = double(img); %things work better with doubles

gfit = fit([xdata(:), ydata(:)], img(:), F, 'StartPoint', c0, 'Lower', low, 'Upper', up); %do fitting
%plot(gfit, [xdata(:), ydata(:)], img(:)); %optional (can be commented out)
c = coeffvalues(gfit);
end