xbins=-2:2;
xbins=xbins*.05/2;
E=[mean([xbins(1) xbins(2)]) mean([xbins(2) xbins(3)]) mean([xbins(3) xbins(4)]) mean([xbins(4) xbins(5)])];
BSslopes=zeros(1,5); %Number of slopes in each bin
BMvs=zeros(1,5); %Average intensity of the master channel in each bin
DSslopes=zeros(1,5);
DMvs=zeros(1,5);
ASslopes=zeros(1,5);
AMvs=zeros(1,5);
for i=1:length(BeforeMSslope(:,1))
    if BeforeMSslope(i,2)<E(1)
        BSslopes(1)=BSslopes(1)+1;
        BMvs(1)=BMvs(1)+BeforeMSslope(i,2);
    else
        if BeforeMSslope(i,2)<E(2)
            BSslopes(2)=BSslopes(2)+1;
            BMvs(2)=BMvs(2)+BeforeMSslope(i,2);
        else
            if BeforeMSslope(i,2)<E(3)
                BSslopes(3)=BSslopes(3)+1;
                BMvs(3)=BMvs(3)+BeforeMSslope(i,2);
            else
                if BeforeMSslope(i,2)<E(4)
                    BSslopes(4)=BSslopes(4)+1;
                    BMvs(4)=BMvs(4)+BeforeMSslope(i,2);
                else
                    BSslopes(5)=BSslopes(5)+1;
                    BMvs(5)=BMvs(5)+BeforeMSslope(i,2);
                end
            end
        end
    end
end
BMvs=BMvs./BSslopes; %Convert sum to average
for i=1:length(DuringMSslope(:,1))
    if DuringMSslope(i,2)<E(1)
        DSslopes(1)=DSslopes(1)+1;
        DMvs(1)=DMvs(1)+DuringMSslope(i,2);
    else
        if DuringMSslope(i,2)<E(2)
            DSslopes(2)=DSslopes(2)+1;
            DMvs(2)=DMvs(2)+DuringMSslope(i,2);
        else
            if DuringMSslope(i,2)<E(3)
                DSslopes(3)=DSslopes(3)+1;
                DMvs(3)=DMvs(3)+DuringMSslope(i,2);
            else
                if DuringMSslope(i,2)<E(4)
                    DSslopes(4)=DSslopes(4)+1;
                    DMvs(4)=DMvs(4)+DuringMSslope(i,2);
                else
                    DSslopes(5)=DSslopes(5)+1;
                    DMvs(5)=DMvs(5)+DuringMSslope(i,2);
                end
            end
        end
    end
end
DMvs=DMvs./DSslopes; %Convert sum to average
for i=1:length(AfterMSslope(:,1))
    if AfterMSslope(i,2)<E(1)
        ASslopes(1)=ASslopes(1)+1;
        AMvs(1)=AMvs(1)+AfterMSslope(i,2);
    else
        if AfterMSslope(i,2)<E(2)
            ASslopes(2)=ASslopes(2)+1;
            AMvs(2)=AMvs(2)+AfterMSslope(i,2);
        else
            if AfterMSslope(i,2)<E(3)
                ASslopes(3)=ASslopes(3)+1;
                AMvs(3)=AMvs(3)+AfterMSslope(i,2);
            else
                if AfterMSslope(i,2)<E(4)
                    ASslopes(4)=ASslopes(4)+1;
                    AMvs(4)=AMvs(4)+AfterMSslope(i,2);
                else
                    ASslopes(5)=ASslopes(5)+1;
                    AMvs(5)=AMvs(5)+AfterMSslope(i,2);
                end
            end
        end
    end
end
AMvs=AMvs./ASslopes; %Convert sum to average