function [Init,Conc]=ICvsFrameStruct(fxycS)

Frames=MaxFrameFXYCS(fxycS);
Init=zeros(1,Frames);
Conc=zeros(1,Frames);
used1=[];
used2=[];
used3=[];
used5=[];
used6=[];

for i=1:length(fxycS)
    if fxycS(i).class==1
        used1=[used1 i];
    end
    if fxycS(i).class==2
        used2=[used2 i];
    end
    if fxycS(i).class==3
        used3=[used3 i];
    end
    if fxycS(i).class==5
        used5=[used5 i];
    end
    if fxycS(i).class==6
        used6=[used6 i];
    end
end

for i=1:length(used3)
    in=min(nonzeros(fxycS(used3(i)).frame));
    co=max(fxycS(used3(i)).frame);
    Init(in)=Init(in)+1;
    Conc(co)=Conc(co)+1;
end
for i=1:length(used1)
    in=min(nonzeros(fxycS(used1(i)).frame));
    %co=max(fxyc(:,1,used1(i)));
    Init(in)=Init(in)+1;
    %Conc(co)=Conc(co)+1;
end
for i=1:length(used2)
    %in=min(nonzeros(fxyc(:,1,used2(i))));
    co=max(fxycS(used2(i)).frame);
    %Init(in)=Init(in)+1;
    Conc(co)=Conc(co)+1;
end
for i=1:length(used5)
    in=min(nonzeros(fxycS(used5(i)).frame));
    %co=max(fxyc(:,1,used5(i)));
    Init(in)=Init(in)+1;
    %Conc(co)=Conc(co)+1;
end
for i=1:length(used6)
    %in=min(nonzeros(fxyc(:,1,used6(i))));
    co=max(fxycS(used6(i)).frame);
    %Init(in)=Init(in)+1;
    Conc(co)=Conc(co)+1;
end