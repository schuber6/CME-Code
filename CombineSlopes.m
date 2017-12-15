function JOSH=CombineSlopes(slopes)

num=0;
JOSH=[];
for i=1:length(slopes)
    JOSH=[JOSH ;nonzeros(slopes{i})];
end
%JOSH(find(JOSH==0))=[];
%JOSH(find(JOSH<-.2))=[];
%JOSH(find(JOSH>.2))=[];