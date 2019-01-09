function INTcell=MakeIntCellFromFXYC_LastN(fxyc,thresh,MinNum,LastN)


F=MaxFrameFXYC(fxyc);
ind=1;
for i=1:length(fxyc(1,1,:))
    if length(find(fxyc(:,5,i)>=thresh))>=MinNum && length(find(fxyc(:,1,i)))>=LastN
        used=find(fxyc(:,1,i),LastN,'last');
        
        INTcell{ind}=fxyc(used,5,i);
        
        ind=ind+1;
    end
end

