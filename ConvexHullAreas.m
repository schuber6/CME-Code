function A=ConvexHullAreas(fxyc)

[TraceX,TraceY]=Record3sXY(fxyc);
[~,F]=size(TraceX);
h=waitbar(0,'Calculating Cell Area');
for i=1:F
    waitbar(i/F)
    if length(nonzeros(TraceX(:,i)))>=2
    [~,A(i)]=convhull(double(nonzeros(TraceX(:,i))),double(nonzeros(TraceY(:,i))));
    else
        A(i)=0;
    end
end
close(h)