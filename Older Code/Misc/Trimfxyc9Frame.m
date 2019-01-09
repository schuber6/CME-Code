function ThreshfxycT=Trimfxyc9Frame(Threshfxyc,f0)

[A,B,C]=size(Threshfxyc);
ind=1;
for i=1:C
    used=find(Threshfxyc(:,1,i)>=f0 & Threshfxyc(:,1,i)<=f0+8);
    if ~isempty(used)
        for i2=1:length(used)
            ThreshfxycT(i2,:,ind)=Threshfxyc(used(i2),:,i);
        end
        ind=ind+1;
    end
end

