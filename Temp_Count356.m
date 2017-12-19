M=MaxFrameFXYCS(fxyc_struct);
three=zeros(1,M);
five=zeros(1,M);
six=zeros(1,M);
for i=1:length(fxyc_struct)
    for i2=1:length(fxyc_struct(i).frame)
        if fxyc_struct(i).class==3
            three(fxyc_struct(i).frame(i2))=three(fxyc_struct(i).frame(i2))+1;
        end
        if fxyc_struct(i).class==5
            five(fxyc_struct(i).frame(i2))=five(fxyc_struct(i).frame(i2))+1;
        end
        if fxyc_struct(i).class==6
            six(fxyc_struct(i).frame(i2))=six(fxyc_struct(i).frame(i2))+1;
        end
    end
end