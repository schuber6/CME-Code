function A356=ConvexHullAreasNSTA(NSTA)


[TraceX,TraceY]=RecordXYNSTA(NSTA);
[~,F]=size(TraceX);
h=waitbar(0,'Calculating Cell Area');
for i=1:F
    waitbar(i/F)
    if length(nonzeros(TraceX(:,i)))>=3
    [~,A356(i)]=convhull(double(nonzeros(TraceX(:,i))),double(nonzeros(TraceY(:,i))));
    else
        A356(i)=0;
    end
end
close(h)