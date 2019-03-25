function CM=ConfusionMatrix(V1,V2)

NC=max(max(V1),max(V2));
CM=zeros(NC);
for i=1:length(V1)
    CM(V1(i),V2(i))=CM(V1(i),V2(i))+1;
end