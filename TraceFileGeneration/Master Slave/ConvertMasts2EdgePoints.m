function P=ConvertMasts2EdgePoints(masks,planes)

num=length(find(masks==.5));
P=zeros(num,3);
ind=1;
planespacing=.4/.7;
for i=1:length(masks(1,1,:))
    [A,B]=find(masks(:,:,i)==.5);
    for i2=1:length(A)
        P(ind,1)=A(i2)*.16; %.16 is the pixel width in um
        P(ind,2)=B(i2)*.16;
        P(ind,3)=mod(i,planes); 
        if P(ind,3)==0
            P(ind,3)=planes;
        end
        P(ind,3)=P(ind,3)*planespacing; %.4 is the most common plane spacing in um (may need to change in some movies)
        ind=ind+1;
    end
end
%Remove planes with less than 1% the edge points as the max--this is likely noise and throws off calculations
for i=1:planes 
    Num(i)=length(find(P(:,3)==i*planespacing));
end
M=max(Num);
count=0;
used=[];
for i=1:planes
    if Num(i)>=M*.01
        count=count+Num(i);
        used=[used i];
    end
end
P2=zeros(count,3);
ind=1;
for i=1:length(used)
    u=find(P(:,3)==used(i)*planespacing);
    for i2=1:length(u)
        P2(ind,:)=P(u(i2),:);
        ind=ind+1;
    end
end
P=P2;
