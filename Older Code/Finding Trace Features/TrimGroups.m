function [TD,TG]=TrimGroups(FM,GM)

TD=[];
TG=[];
for i=unique(GM)
    u=find(GM==i);
    D=FM(u);
    D2=TrimData(D,5,95);
    TD=[TD D2];
    TG=[TG zeros(1,length(D2))+i];
end