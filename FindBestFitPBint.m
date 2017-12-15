function Sing=FindBestFitPBint(Us,Ls,MaxBleach)


for i=1:400
    SSres(i)=0;
    Si(i)=i*100;
    for i2=1:length(Us)
        U=Us(i2);
        L=Ls(i2);
        vect=[];
        for i3=1:MaxBleach
            vect(i3)=(U-L-Si(i)*i3)^2;
        end
        res=min(vect);
        SSres(i)=SSres(i)+res;
    end
end
best=find(SSres==min(SSres));
Sing=Si(best(1));