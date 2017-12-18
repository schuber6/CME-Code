function MSD_Flagged=RemoveBadSlaves(MSD)
%Sets intensity of bad slave fits to 0

N=length(MSD);
LboundSDX=.25;
LboundSDY=.25;
UboundSDX=2.5;
UboundSDY=2.5;
AboundDX=2;
AboundDY=2;
MSD_Flagged=cell(1,length(MSD));
for trace=1:N
    Flags=zeros(length(MSD{trace}(:,1)),6);
    for i=1:length(MSD{trace}(:,1))
        if MSD{trace}(i,9)<LboundSDX
            Flags(i,1)=1;
        end
        if MSD{trace}(i,9)>UboundSDX
            Flags(i,2)=1;
        end
        if MSD{trace}(i,10)<LboundSDY
            Flags(i,3)=1;
        end
        if MSD{trace}(i,10)>UboundSDY
            Flags(i,4)=1;
        end
        if abs(MSD{trace}(i,2)-MSD{trace}(i,6))>AboundDX
            Flags(i,5)=1;
        end
        if abs(MSD{trace}(i,3)-MSD{trace}(i,7))>AboundDY
            Flags(i,6)=1;
        end
        Flags(i,7)=max(Flags(i,:));
        MSD_Flagged{trace}(i,:)=MSD{trace}(i,:);
        if Flags(i,7)==1
            MSD_Flagged{trace}(i,5)=0;
        end
    end
    
end