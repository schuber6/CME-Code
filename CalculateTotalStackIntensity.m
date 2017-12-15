function [IT] = CalculateTotalStackIntensity(filename,planes)

Fullstacks=floor(length(imfinfo(filename))/planes);
IT=zeros(1,Fullstacks);
for i0=1:Fullstacks
    it=0;
    for i=1:planes
        A=imread(filename,'Index',i+(i0-1)*planes);
        it=it+sum(sum(A));
    end
    IT(i0)=it;
end