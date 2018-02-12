function [X,Y,u,v]=ScatterWithArrows(X,Y)

for i=1:length(X)-1
    u(i)=X(i+1)-X(i);
    v(i)=Y(i+1)-Y(i);
end
%figure
scatter(X,Y)
hold on
colormap jet
cmap=colormap;
N=length(cmap(:,1));
T=length(u);
xqs=(0:T-1)*(N-1)/(T-1)+1;
xs=1:N;
CsR=interp1(xs,cmap(:,1),xqs);
CsG=interp1(xs,cmap(:,2),xqs);
CsB=interp1(xs,cmap(:,3),xqs);
Cs=[CsR.' CsG.' CsB.'];
for i=1:length(u)
    quiver(X(i).',Y(i).',u(i),v(i),0,'Color',Cs(i,:));
end