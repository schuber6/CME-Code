function Amask=MaskAreas(masks)

[A,B,C]=size(masks);
Amask=zeros(1,C);
h=waitbar(0,'Finding Mask Area');
for i=1:C
    waitbar(i/C)
    for i2=1:A
        for i3=1:B
            if masks(i2,i3,i)>0
                Amask(i)=Amask(i)+1;
            end
        end
    end
end
close(h)