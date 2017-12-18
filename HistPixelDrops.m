function Subs=HistPixelDrops(Movie)

MP=10000;
NbinsP=100;
F=length(imfinfo(Movie));
[A,B]=size(imread(Movie));
Subs=cell(1,F-1);
for i=1:F-1
    IM1=imread(Movie,'Index',i);
    IM2=imread(Movie,'Index',i+1);
    SM=double(IM2)-double(IM1);
    Subs{i}=reshape(SM,[1 A*B]);
end
TSubs=[];
for i=1:length(Subs)
    TSubs=[TSubs Subs{i}];
end
xbins=-NbinsP:NbinsP;
xbins=xbins/NbinsP*MP;
H=hist(TSubs,xbins);
for i=1:length(H)
    Hs(i)=H(i)-H(length(H)-i+1);
end
plot(xbins,Hs)
xlim([-MP MP])