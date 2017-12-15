function [BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios_ClassRestricted(fxyc_struct)

MasterThresh=400;
SlaveThresh=400;
RatioThresh=.5;

xbins=-2:2;
xbins=xbins*.04/2;
E=[mean([xbins(1) xbins(2)]) mean([xbins(2) xbins(3)]) mean([xbins(3) xbins(4)]) mean([xbins(4) xbins(5)])];
BINTslopes=zeros(1,5); %Number of slopes in each bin
BSlaveV=cell(1,5); %Average intensity of the master channel in each bin
BMasterV=cell(1,5);
BRatio=cell(1,5);
LsI=[];

xbins2=-50:50;
xbins2=xbins2*.11/50; %Bins for full GRhist

for i=1:length(fxyc_struct)
    for i2=1:length(fxyc_struct(i).sl)
        GR=fxyc_struct(i).sl(i2);
        if GR~=0
            SV=fxyc_struct(i).Sint(i2);
            MV=fxyc_struct(i).int(i2);
            cl=fxyc_struct(i).class;
            if MV>=MasterThresh && SV>=SlaveThresh && MV/SV>=RatioThresh && cl~=4 && cl~=7 
                if GR<E(1)
                    BINTslopes(1)=BINTslopes(1)+1;
                    BSlaveV{1}=[BSlaveV{1} SV];
                    BMasterV{1}=[BMasterV{1} MV];
                    BRatio{1}=[BRatio{1} MV/SV];
                    LsI=[LsI GR];
                else
                    if GR<E(2)
                        BINTslopes(2)=BINTslopes(2)+1;
                        BSlaveV{2}=[BSlaveV{2} SV];
                        BMasterV{2}=[BMasterV{2} MV];
                        BRatio{2}=[BRatio{2} MV/SV];
                        LsI=[LsI GR];
                    else
                        if GR<E(3)
                            BINTslopes(3)=BINTslopes(3)+1;
                            BSlaveV{3}=[BSlaveV{3} SV];
                            BMasterV{3}=[BMasterV{3} MV];
                            BRatio{3}=[BRatio{3} MV/SV];
                            LsI=[LsI GR];
                        else
                            if GR<E(4)
                                BINTslopes(4)=BINTslopes(4)+1;
                                BSlaveV{4}=[BSlaveV{4} SV];
                                BMasterV{4}=[BMasterV{4} MV];
                                BRatio{4}=[BRatio{4} MV/SV];
                                LsI=[LsI GR];
                            else
                                BINTslopes(5)=BINTslopes(5)+1;
                                BSlaveV{5}=[BSlaveV{5} SV];
                                BMasterV{5}=[BMasterV{5} MV];
                                BRatio{5}=[BRatio{5} MV/SV];
                                LsI=[LsI GR];
                            end
                        end
                    end
                end
            end
        end
    end
end