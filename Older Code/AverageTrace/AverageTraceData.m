function [Cat,Csdt,Cset]=AverageTraceData(IntCellS,used)

CC=cell(1,length(IntCellS{1}));
for i=1:length(used)
    T=IntCellS{used(i)};
    for i2=1:length(T)
        CC{i2}=[CC{i2} T(i2)];
    end
end
Cat=StatCell_Fancy(CC,@mean);
Csdt=StatCell_Fancy(CC,@std);
Cset=Csdt/sqrt(length(used));