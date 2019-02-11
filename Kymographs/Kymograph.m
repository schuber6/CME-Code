function K=Kymograph(IM,xi,yi)
%Use the improfile function to slice a time-series of 2d images into a 2d
%image with one spatial axis, and one time axis (kymograph)


[~,~,L]=size(IM);
c = improfile(IM(:,:,1),xi,yi);
K=zeros(L,length(c));
for i=1:L
    K(i,:) = improfile(IM(:,:,i),xi,yi);
end


