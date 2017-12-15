function E=FindFinalEdgeRatios(bx,by,mask)
%Sees what ratio of bleb edge pixels are on the outside of the cell to weed
%out noise
E=[];
for i=1:length(bx)
    Px=length(bx{i});
    EPx=0;
    for i2=1:Px
        if mask(by{i}(i2),bx{i}(i2))==.5
            EPx=EPx+1;
        end
    end
       E(i)=EPx/Px;     
end