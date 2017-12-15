xbins=-2:2;
xbins=xbins*.04/2;
E=[mean([xbins(1) xbins(2)]) mean([xbins(2) xbins(3)]) mean([xbins(3) xbins(4)]) mean([xbins(4) xbins(5)])];
BINTslopes=zeros(1,5); %Number of slopes in each bin
BZslopesV=zeros(1,5); %Average intensity of the master channel in each bin
LsZL=cell(1,5);

for i=1:length(LsI)
    if LsI(i)<E(1)
        BINTslopes(1)=BINTslopes(1)+LvI(i);
        BZslopesV(1)=BZslopesV(1)+LsZ(i)*LvI(i);
        LsZL{1}=[LsZL{1} LsZ(i)];
    else
        if LsI(i)<E(2)
            BINTslopes(2)=BINTslopes(2)+LvI(i);
            BZslopesV(2)=BZslopesV(2)+LsZ(i)*LvI(i);
            LsZL{2}=[LsZL{2} LsZ(i)];
        else
            if LsI(i)<E(3)
                BINTslopes(3)=BINTslopes(3)+LvI(i);
                BZslopesV(3)=BZslopesV(3)+LsZ(i)*LvI(i);
                LsZL{3}=[LsZL{3} LsZ(i)];
            else
                if LsI(i)<E(4)
                    BINTslopes(4)=BINTslopes(4)+LvI(i);
                    BZslopesV(4)=BZslopesV(4)+LsZ(i)*LvI(i);
                    LsZL{4}=[LsZL{4} LsZ(i)];
                else
                    BINTslopes(5)=BINTslopes(5)+LvI(i);
                    BZslopesV(5)=BZslopesV(5)+LsZ(i)*LvI(i);
                    LsZL{5}=[LsZL{5} LsZ(i)];
                end
            end
        end
    end
end

BZslopesV=BZslopesV./BINTslopes; %Convert sum to average