function c=FitSlave5_3d_adj(f,p,Mp,x,y,fileSlave,Background)

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
    cp(i,:)=FitSlave5(fp,x,y,fileSlave,Background);
    
end
c(1)=sum(cp(:,1));
c(2)=sum(cp(:,2));
c(3)=mean(cp(:,3));
c(4)=mean(cp(:,4));
c(5)=mean(cp(:,5));
c(6)=mean(cp(:,6));
c(7)=mean(cp(:,7));
c(8)=sum(cp(:,8));