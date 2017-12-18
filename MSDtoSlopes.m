INTsM=cell(size(MSDfe));
INTsS=cell(size(MSDfe));
INTsF=cell(size(MSDfe));
for i=1:length(MSDfe)
    INTsM{i}=MSDfe{i}(:,4);
    INTsS{i}=MSDfe{i}(:,5);
    INTsF{i}=MSDfe{i}(:,1);
end
slopesM = slope_finding(INTsM,3,400);
slopesS = slope_finding(INTsS,3,400);

    