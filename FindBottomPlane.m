function [Mbp,Ibp,me,I]=FindBottomPlane(movie,planes)
%Finds bottom plane based on: Intensity change std, Intensity change mean,
%Highest Intensity
FullPlanes=floor(length(imfinfo(movie))/planes);
Sbp=zeros(1,FullPlanes);
Mbp=zeros(1,FullPlanes);
Ibp=zeros(1,FullPlanes);
[me]=HistPlaneMultiplications(movie);
I=SumIntensityVsFrame(movie);
for i=1:FullPlanes
    for i2=1:planes-1
        %stdi(i2)=std((i-1)*planes+i2);
        mei(i2)=me((i-1)*planes+i2);
        Ii(i2)=I((i-1)*planes+i2);
    end
    %Sbp(i)=find(stdi==max(stdi),1,'first');
    Mbp(i)=find(mei==max(mei),1,'first');
    Ibp(i)=find(Ii==max(Ii),1,'first');
end
    