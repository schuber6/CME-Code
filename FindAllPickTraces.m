function [MSD_chosen,Ts,Es]=FindAllPickTraces(MSD)

SThresh=5000;
MThresh=5000;
SDropP=40;
MDropP=40;
AvWin=3;

N=length(MSD);
num=0;
Ts=[];
Es=[];
for T=1:length(MSD)
    
    usedST=find(MSD{T}(:,5)>=SThresh);
    usedMT=find(MSD{T}(:,4)>=MThresh);
    usedT=intersect(usedST,usedMT);
    M=length(MSD{T}(:,1));
    for i=1:length(usedT)
        final=min(M,usedT(i)+AvWin-1);
        SDp=(MSD{T}(usedT(i),5)-MSD{T}(final,5))/MSD{T}(usedT(i),5);
        MDp=(MSD{T}(usedT(i),4)-MSD{T}(final,4))/MSD{T}(usedT(i),4);
        if SDp>=SDropP/100 && MDp>=MDropP/100
            Ts=[Ts T];
            Es=[Es final];
            num=num+1;
            break
        end
    end
end
for i=1:length(Ts)
    MSD_chosen{i}=MSD{Ts(i)};
end