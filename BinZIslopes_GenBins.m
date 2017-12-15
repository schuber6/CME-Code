Mean=mean(LsI);
SD=sqrt(var(LsI));
%Nbins=10;


xbins=-Nbins:Nbins;
xbins=xbins*(abs(Mean)+SD)*2/Nbins;
NbinsT=length(xbins);
E=[];
for i=1:length(xbins)-1
    E(i)=mean([xbins(i) xbins(i+1)]);
end

BINTslopes=zeros(1,NbinsT); %Number of slopes in each bin
BZslopesV=zeros(1,NbinsT); %Average intensity of the master channel in each bin
LsZL=cell(1,NbinsT);

for i=1:length(LsI)
    if LsD(i)<=DistCutoff;
    for i2=1:length(xbins)
        if i2==length(xbins) || LsI(i)<E(i2)
            BINTslopes(i2)=BINTslopes(i2)+1;
            BZslopesV(i2)=BZslopesV(i2)+LsZ(i);
            LsZL{i2}=[LsZL{i2} LsZ(i)];
            break
        end
    end
    end
end

BZslopesV=BZslopesV./BINTslopes; %Convert sum to average