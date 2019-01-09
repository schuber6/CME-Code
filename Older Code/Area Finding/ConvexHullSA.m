function SA=ConvexHullSA(K,P)

SA=0;

for i=1:length(K(:,1))
    A=P(K(i,1),:);
    B=P(K(i,2),:);
    C=P(K(i,3),:);
    AB=A-B;
    AC=A-C;
    area=norm(cross(AB,AC))/2;
    SA=SA+area;
    
end