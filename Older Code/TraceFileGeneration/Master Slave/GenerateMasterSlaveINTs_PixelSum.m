function [FXYCMS]=GenerateMasterSlaveINTs_PixelSum(Threshfxyc,fileSlave,MasterThresh,fileMaster)
%Takes fxyc data, slave movie, and intensity threshold and generates INT
%cells


if isempty(Threshfxyc)
    FXYCMS={};
    return
end
[A,B,C]=size(Threshfxyc);
events=[];
for i=1:C
    used=find(Threshfxyc(:,1,i));
    %for i2=1:length(used)
        events=[events ; [Threshfxyc(used,1:3,i)]];
    %end
end
[MIs,Bs]=ManualFitEvents_BackR(events,fileMaster,3,0,'sum');
[SIs,Bs]=ManualFitEvents_BackR(events,fileSlave,3,0,'sum');
ind=1;
for i=1:C
    used=find(Threshfxyc(:,1,i));
    FXYCMS{i}=[];
    for i2=1:length(used)
        FXYCMS{i}=[FXYCMS{i} ; [Threshfxyc(i2,1:5,i) MIs(ind) SIs(ind)]];
        ind=ind+1;
    end
end
