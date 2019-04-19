fs=[fxyc_struct.frame];
xs=[fxyc_struct.xpos];
ys=[fxyc_struct.ypos];


for i=1:length(fxyc_struct)
    fxyc=fxyc_struct(i);
    for i2=1:length(fxyc.frame)
        f=fxyc.frame(i2);
        x=fxyc.xpos(i2);
        y=fxyc.ypos(i2);
        used=find(fs==f & ys==y & xs==x);
        LU(i2)=length(used);
    end
    MA(i)=max(LU);
    MI(i)=min(LU);
end
max(MA)
min(MI)
%%
fs=[fxyc_struct.frame];
inds=zeros(1,length(fs));
ind=1;
for i=1:length(fxyc_struct)
    for i2=1:length(fxyc_struct(i).frame)
        inds(ind)=i;
        ind=ind+1;
    end
end
xs=[fxyc_struct.xpos];
ys=[fxyc_struct.ypos];
is=[fxyc_struct.int];
i=3;
fxyc=fxyc_struct(i);
LU=zeros(1,length(fxyc.frame));
for i2=1:length(fxyc.frame)
    f=fxyc.frame(i2);
    x=fxyc.xpos(i2);
    y=fxyc.ypos(i2);
    used=find(fs==f & ys==y & xs==x);
    LU(i2)=length(used);
end
dups=inds(used)
[f y x]
fxyc=fxyc_struct(dups(4));
