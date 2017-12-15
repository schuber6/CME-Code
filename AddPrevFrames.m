function Prevfxyc=AddPrevFrames(fxyc)

[A,B,C]=size(fxyc);
for i=1:C
    used=find(fxyc(:,1,i));
    Mini=fxyc(used,:,i);
    frames=fxyc(used,1,i);
    x=fxyc(used(1),2,i);
    y=fxyc(used(1),3,i);
    c=fxyc(used(1),4,i);
    MF=min(frames);
    extra=[];
  
    for i2=max(MF-10, 1):MF-1
        extra=[extra ; [i2 x y c 0]];
    end
    [D,E]=size(Mini);
    if isempty(extra)
        F=0;
    else
    F=length(extra(:,1));
    end
    for i2=1:D
        for i3=1:E
            extra(F+i2,i3)=Mini(i2,i3);
        end
    end
    [D,E]=size(extra);
    for i2=1:D
        for i3=1:E
            Prevfxyc(i2,i3,i)=extra(i2,i3);
        end
    end
end

