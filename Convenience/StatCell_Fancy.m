function Mat=StatCell_Fancy(C,fun)
%Pass in any function handle as fun and this will compute the value of fun
%on each cell of cell array C and return it as an element in Mat

for i=1:length(C)
    Mat(i)=fun(C{i});
end