function H=IntensityHistogram(IMG)

[a,b]=size(IMG);
V=zeros(1,a*b);
ind=1;
for i=1:a
    for i2=1:b
        V(ind)=IMG(i,i2);
        ind=ind+1;
    end
end
bins=1:1000;
bins=bins;
H=hist(V,bins);