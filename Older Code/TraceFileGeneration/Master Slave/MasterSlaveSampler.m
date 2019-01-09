S=500;
N=length(fxyc_struct);
n=0;
int=[];
Sint=[];
SBack=[];
Sint5=[];
SBack5=[];
SSum5=[];
Mint=[];
MBack=[];
Mint5=[];
MBack5=[];
MSum5=[];
i=ceil(rand*N);
while n<S
    %i=ceil(rand*N);
    if fxyc_struct(i).class~=4
        L=length(fxyc_struct(i).frame);
        l=ceil(rand*L);
        int=[int fxyc_struct(i).int(l)];
        Sint=[Sint fxyc_struct(i).Sint(l)];
        SBack=[SBack fxyc_struct(i).SBack(l)];
        Sint5=[Sint5 fxyc_struct(i).Sint5(l)];
        SBack5=[SBack5 fxyc_struct(i).SBack5(l)];
        SSum5=[SSum5 fxyc_struct(i).SSum5(l)];
        Mint=[Mint fxyc_struct(i).Mint(l)];
        MBack=[MBack fxyc_struct(i).MBack(l)];
        Mint5=[Mint5 fxyc_struct(i).Mint5(l)];
        MBack5=[MBack5 fxyc_struct(i).MBack5(l)];
        MSum5=[MSum5 fxyc_struct(i).MSum5(l)];
        n=n+1;
    end
end