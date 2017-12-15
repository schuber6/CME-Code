function AV=AverageBackground(exp_name,name,channels)
%Averages each channel of background tif and saves it as a background mat
%which contains a cell array with an image matrix per channel

IM=imread(name,'Index',1);
[A,B]=size(IM);
SUM=zeros(channels,A,B);
num=zeros(1,channels);
for i=1:length(imfinfo(name))
    IM=imread(name,'Index',i);
    N=mod(i,channels);
    if N==0
        N=channels;
    end
    C(1,:,:)=double(IM);
    SUM(N,:,:)=SUM(N,:,:)+C;
    num(N)=num(N)+1;
end
for i=1:channels
    AV{i}=reshape(floor(SUM(i,:,:)/num(N)),[A,B]);
end
backfile=strcat(exp_name,'/background.mat');
save(backfile,'AV')