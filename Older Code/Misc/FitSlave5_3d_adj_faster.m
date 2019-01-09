function cs=FitSlave5_3d_adj_faster(f,ps,Mp,xs,ys,fileSlave)

%Give it all the spots in a frame at the same time
Fstart=(f-1)*Mp+1; %First frame of the zstack
for i0=1:length(xs)
    p=ps(i0);
    x=xs(i0);
    y=ys(i0);
if p~=1 && p~=Mp
    Ps(i0,:)=[p-1 p p+1];
else
    if p==1
        Ps(i0,:)=[1 2 3];
    else
        if p==Mp
            Ps(i0,:)=[Mp-2 Mp-1 Mp];
        end
    end
end
end

for i0=1:max(max(Ps))
    [usedx,usedy]=find(Ps==i0);
    if ~isempty(usedx)
     fp=Fstart-1+i0;
     subxs=xs(usedx);
       subys=ys(usedx);
       subns=usedy;
    
    cps_plane=FitSlave5_faster(fp,subxs,subys,fileSlave);
    for i=1:length(cps_plane(:,1))
        cps{usedx(i)}(usedy(i),:)=cps_plane(i,:);
    end
    end
end
for i0=1:length(cps)
cs(i0,1)=sum(cps{i0}(:,1));
cs(i0,2)=sum(cps{i0}(:,2));
cs(i0,3)=sum(cps{i0}(:,3));
cs(i0,4)=sum(cps{i0}(:,4));
end

