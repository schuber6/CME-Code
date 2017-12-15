xbins=-2:2;
xbins=xbins*.04/2;
E=[mean([xbins(1) xbins(2)]) mean([xbins(2) xbins(3)]) mean([xbins(3) xbins(4)]) mean([xbins(4) xbins(5)])];
BINTslopes=zeros(1,5); %Number of slopes in each bin
BZslopesV=zeros(1,5); %Average intensity of the master channel in each bin
LsZL=cell(1,5);
LvZL=cell(1,5);
for i=1:length(LsI)
    if LsI(i)<E(1)
        BINTslopes(1)=BINTslopes(1)+1;
        BZslopesV(1)=BZslopesV(1)+LsZ(i);
        LsZL{1}=[LsZL{1} LsZ(i)];
        LvZL{1}=[LvZL{1} LvZ(i)];
    else
        if LsI(i)<E(2)
            BINTslopes(2)=BINTslopes(2)+1;
            BZslopesV(2)=BZslopesV(2)+LsZ(i);
            LsZL{2}=[LsZL{2} LsZ(i)];
            LvZL{2}=[LvZL{2} LvZ(i)];
        else
            if LsI(i)<E(3)
                BINTslopes(3)=BINTslopes(3)+1;
                BZslopesV(3)=BZslopesV(3)+LsZ(i);
                LsZL{3}=[LsZL{3} LsZ(i)];
                LvZL{3}=[LvZL{3} LvZ(i)];
            else
                if LsI(i)<E(4)
                    BINTslopes(4)=BINTslopes(4)+1;
                    BZslopesV(4)=BZslopesV(4)+LsZ(i);
                    LsZL{4}=[LsZL{4} LsZ(i)];
                    LvZL{4}=[LvZL{4} LvZ(i)];
                else
                    BINTslopes(5)=BINTslopes(5)+1;
                    BZslopesV(5)=BZslopesV(5)+LsZ(i);
                    LsZL{5}=[LsZL{5} LsZ(i)];
                    LvZL{5}=[LvZL{5} LvZ(i)];
                end
            end
        end
    end
end

BZslopesV=BZslopesV./BINTslopes; %Convert sum to average