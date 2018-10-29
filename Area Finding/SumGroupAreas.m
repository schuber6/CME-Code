function Areas=SumGroupAreas(DSIOfiles,used)

Areas=zeros(1,length(used));
for i=1:length(used)
    Areas(i)=sum([DSIOfiles(used{i}).area]);
end