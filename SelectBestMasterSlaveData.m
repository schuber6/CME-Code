function Good=SelectBestMasterSlaveData(fxyc_struct)

MaxDist58=.25;
MaxDistMS=1;
MinInt=600;
MinSD=.4;
MaxSD=1.5;
Good=[];
for i=1:length(fxyc_struct)
    for i2=1:length(fxyc_struct(i).frame)
        %Separate if statements for readability
        if norm([fxyc_struct(i).Sx(i2)-fxyc_struct(i).Sx5(i2) fxyc_struct(i).Sy(i2)-fxyc_struct(i).Sy5(i2)])<=MaxDist58
        if norm([fxyc_struct(i).Mx(i2)-fxyc_struct(i).Mx5(i2) fxyc_struct(i).My(i2)-fxyc_struct(i).My5(i2)])<=MaxDist58
        if norm([fxyc_struct(i).Sx(i2)-fxyc_struct(i).Mx(i2) fxyc_struct(i).Sy(i2)-fxyc_struct(i).My(i2)])<=MaxDistMS
        if fxyc_struct(i).Mint(i2)>=MinInt && fxyc_struct(i).Mint5(i2)>=MinInt && fxyc_struct(i).Sint(i2)>=MinInt && fxyc_struct(i).Sint5(i2)>=MinInt
        if fxyc_struct(i).Msdx(i2)>=MinSD && fxyc_struct(i).Msdy(i2)>=MinSD && fxyc_struct(i).Msdx5(i2)>=MinSD && fxyc_struct(i).Msdy5(i2)>=MinSD
        if fxyc_struct(i).Ssdx(i2)>=MinSD && fxyc_struct(i).Ssdy(i2)>=MinSD && fxyc_struct(i).Ssdx5(i2)>=MinSD && fxyc_struct(i).Ssdy5(i2)>=MinSD
        if fxyc_struct(i).Msdx(i2)<=MaxSD && fxyc_struct(i).Msdy(i2)<=MaxSD && fxyc_struct(i).Msdx5(i2)<=MaxSD && fxyc_struct(i).Msdy5(i2)<=MaxSD
        if fxyc_struct(i).Ssdx(i2)<=MaxSD && fxyc_struct(i).Ssdy(i2)<=MaxSD && fxyc_struct(i).Ssdx5(i2)<=MaxSD && fxyc_struct(i).Ssdy5(i2)<=MaxSD
            Good=[Good ; [i i2]];
        end
        end
        end
        end
        end
        end
        end
        end
    end
end