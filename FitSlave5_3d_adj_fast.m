function c=FitSlave5_3d_adj_fast(f,p,Mp,x,y,fileSlave)

if p~=1 && p~=Mp
    Ps=[p-1 p p+1];
else
    if p==1
        Ps=[1 2 3];
    else
        if p==Mp
            Ps=[Mp-2 Mp-1 Mp];
        end
    end
end
Fstart=(f-1)*Mp+1; %First frame of the zstack
for i=1:length(Ps)
    fp=Fstart-1+Ps(i);
    cp(i,:)=FitSlave5_fast(fp,x,y,fileSlave);
    
end
c(1)=sum(cp(:,1));
c(2)=sum(cp(:,2));
c(3)=sum(cp(:,3));
c(4)=sum(cp(:,4));
