function TraceAP2vsCLTA(fxyc_struct,Good,t)

used=find(Good(:,1)==t);
x=[];
y=[];
u=[];
v=[];
for i=1:length(used)-1
    x1=fxyc_struct(t).MSum5(Good(used(i),2));
    x2=fxyc_struct(t).MSum5(Good(used(i+1),2));
    y1=fxyc_struct(t).SSum5(Good(used(i),2));
    y2=fxyc_struct(t).SSum5(Good(used(i+1),2));
    u1=x2-x1;
    v1=y2-y1;
    x=[x x1];
    y=[y y1];
    u=[u u1];
    v=[v v1];
end
quiver(x,y,u,v,0,'Color','k')