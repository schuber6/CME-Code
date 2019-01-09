function fxyc_struct=AddSlaveInt5(fxyc_struct,MSD)

for i=1:length(MSD)
    Fs=fxyc_struct(i).frame;
    Slave=zeros(length(Fs),1);
    SB=zeros(length(Fs),1);
    SS=zeros(length(Fs),1);
    Sx=zeros(length(Fs),1);
    Sy=zeros(length(Fs),1);
    SSx=zeros(length(Fs),1);
    SSy=zeros(length(Fs),1);
    for i2=1:length(Fs)
        Ind=find(MSD{i}(:,1)==Fs(i2));
        if ~isempty(Ind)
            Slave(i2)=MSD{i}(Ind(1),5);
            SB(i2)=MSD{i}(Ind(1),8);
            SS(i2)=MSD{i}(Ind(1),12);
            Sx(i2)=MSD{i}(Ind(1),6);
            Sy(i2)=MSD{i}(Ind(1),7);
            SSx(i2)=MSD{i}(Ind(1),9);
            SSy(i2)=MSD{i}(Ind(1),10);
        end
    end
    fxyc_struct(i).Sint5=single(Slave);
    fxyc_struct(i).SBack5=single(SB);
    fxyc_struct(i).SSum5=single(SS);
    fxyc_struct(i).Sx5=single(Sx);
    fxyc_struct(i).Sy5=single(Sy);
    fxyc_struct(i).Ssdx5=single(SSx);
    fxyc_struct(i).Ssdy5=single(SSy);
end