function Xc=SplitByPRCT(X,col,NBins)

Xc=cell(1,NBins);
for i=1:NBins
    cutoffs(i)=prctile(X(:,col),100/(NBins)*i);
end
for i=1:length(X(:,1))
    for i2=1:NBins
        if X(i,col)<cutoffs(i2)
            cohort(i)=i2;
            break
        end
    end
end
for i=1:NBins
    used=find(cohort==i);
    Xc{i}=X(used,:);
end