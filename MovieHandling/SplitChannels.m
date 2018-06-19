function SplitChannels(movie,oddnew,evennew,varargin)
%Splits 2 channel movies into an odd channel and an even channel

if nargin==4
    N=varargin{1};
else
    N=length(imfinfo(movie));
end


for i=1:N
    A=imread(movie,'Index',i);
    if ceil(i/2)==i/2
        imwrite(A,evennew,'Writemode','append','Compression','none')
    else
        imwrite(A,oddnew,'Writemode','append','Compression','none')
    end
end