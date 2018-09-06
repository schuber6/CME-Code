function [V,Ng,SD]=AverageByFrame(Vd,Fd,Edges)

Vc=cell(1,length(Edges)-1);
for i=1:length(Fd)
    G=find(Edges<=Fd(i),1,'last');
    Vc{G(1)}=[Vc{G(1)} Vd(i)];
end
V=StatCell_Fancy(Vc,@median);
SD=StatCell_Fancy(Vc,@StandardDeviation);
Ng=StatCell_Fancy(Vc,@length);