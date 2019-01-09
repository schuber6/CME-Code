function [MaxD,RMSD]=DistSubParams(D)

for i=1:length(D)
    MaxD(i)=max(D{i});
    RMSD(i)=sqrt(mean(D{i}.^2));
end