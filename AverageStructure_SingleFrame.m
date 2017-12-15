function [AS,num]=AverageStructure_SingleFrame(f,ps,Mp,xs,ys,fileSlave,N)

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
AS=zeros(N);
num=0;
for i0=1:max(max(Ps))
    [usedx,usedy]=find(Ps==i0);
    if ~isempty(usedx)
     fp=Fstart-1+i0;
     subxs=xs(usedx);
       subys=ys(usedx);
       subns=usedy;
    
    [cps_plane,n]=AverageStructure_SinglePlane(fp,subxs,subys,fileSlave,N);
    num=num+n;
    AS=AS+cps_plane;
    end
end

