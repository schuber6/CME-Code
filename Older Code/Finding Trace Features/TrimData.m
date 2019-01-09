function TData=TrimData(Data,LowerPCT,UpperPCT)

NL=prctile(Data,LowerPCT);
NU=prctile(Data,UpperPCT);
used=find(Data>=NL & Data<=NU);
TData=Data(used);