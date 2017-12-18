function INTcell=MakeIntCellFromFXYC(fxyc,thresh,MinNum)


F=MaxFrameFXYC(fxyc);
ind=1;
for i=1:length(fxyc(1,1,:))
    if length(find(fxyc(:,5,i)>=thresh))>=MinNum
        used=find(fxyc(:,1,i));
        
            INTcell{ind}=fxyc(used,5,i);
        
        ind=ind+1;
    end
end

