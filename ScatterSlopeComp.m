[slopes, intercepts, rsqs]=LinearSlopeInterceptandR2(MS,SS);
x0=min(MS);
y0=slopes*x0+intercepts;
num=0;
for i=1:length(Good(:,1))-1
    if Good(i+1,1)==Good(i,1) && Good(i+1,2)==Good(i,2)+1
        num=num+1;
        t=Good(i,1);
        n=Good(i,2);
        Sf(num)=atand((fxyc_struct(t).SSum5(n)-fxyc_struct(t).SSum5(n+1))/(fxyc_struct(t).MSum5(n)-fxyc_struct(t).MSum5(n+1)));
        Si(num)=atand((fxyc_struct(t).SSum5(n)-y0)/(fxyc_struct(t).MSum5(n)-x0));
    end
end
scatter(Si,Sf)
hold on
[slopes, intercepts, rsqs]=LinearSlopeInterceptandR2(Si,Sf);
x0=0;
x1=max(Si);
y0=intercepts;
y1=slopes*x1+intercepts;
line([x0 x1],[y0 y1],'Color','g')
