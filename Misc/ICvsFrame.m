function [Init,Conc]=ICvsFrame(fxyc)

Frames=max(max(fxyc(:,1,:)));
Init=zeros(1,Frames);
Conc=zeros(1,Frames);

used1=find(fxyc(1,4,:)==1);
used2=find(fxyc(1,4,:)==2);
used3=find(fxyc(1,4,:)==3);
used5=find(fxyc(1,4,:)==5);
used6=find(fxyc(1,4,:)==6);

for i=1:length(used3)
    in=min(nonzeros(fxyc(:,1,used3(i))));
    co=max(fxyc(:,1,used3(i)));
    Init(in)=Init(in)+1;
    Conc(co)=Conc(co)+1;
end
for i=1:length(used1)
    in=min(nonzeros(fxyc(:,1,used1(i))));
    %co=max(fxyc(:,1,used1(i)));
    Init(in)=Init(in)+1;
    %Conc(co)=Conc(co)+1;
end
for i=1:length(used2)
    %in=min(nonzeros(fxyc(:,1,used2(i))));
    co=max(fxyc(:,1,used2(i)));
    %Init(in)=Init(in)+1;
    Conc(co)=Conc(co)+1;
end
for i=1:length(used5)
    in=min(nonzeros(fxyc(:,1,used5(i))));
    %co=max(fxyc(:,1,used5(i)));
    Init(in)=Init(in)+1;
    %Conc(co)=Conc(co)+1;
end
for i=1:length(used6)
    %in=min(nonzeros(fxyc(:,1,used6(i))));
    co=max(fxyc(:,1,used6(i)));
    %Init(in)=Init(in)+1;
    Conc(co)=Conc(co)+1;
end
