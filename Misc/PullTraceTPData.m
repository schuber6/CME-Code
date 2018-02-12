function [IncData,DecData]=PullTraceTPData(fxycMS)

%Column Descriptions (only uses 3s because lifetimes)
%Ints are found from pixel sums - background pixel sum
%1-Frame
%2-Lifetime
%3-int
%4-Pixel Master int
%5-Pixel Slave int
%6-Log(4/5)
%7-% of phase


used=find(fxycMS(1,4,:)==3);
%Data=zeros(length(used),12);
countI=0;
countD=0;
for i=1:length(used)
    usedT=find(fxycMS(:,6,used(i))>0 & fxycMS(:,9,used(i))>0);
    M=find(fxycMS(:,6,used(i))==max(fxycMS(:,6,used(i))));
    MC=max(fxycMS(:,6,used(i)));
    MA=max(fxycMS(:,9,used(i)));
    if ~isempty(usedT) && length(usedT)>=10
        for i2=1:length(usedT)
            if usedT(i2)<=M && M~=usedT(1)
                countI=countI+1;
                IncData(countI,1)=fxycMS(usedT(i2),1,used(i));
                IncData(countI,2)=fxycMS(usedT(end),1,used(i))-fxycMS(usedT(1),1,used(i));
                IncData(countI,3)=fxycMS(usedT(i2),5,used(i));
                
                IncData(countI,4)=fxycMS(usedT(i2),9,used(i));%/MA;
                IncData(countI,5)=fxycMS(usedT(i2),6,used(i))/MC;
                IncData(countI,6)=log(IncData(countI,4)/IncData(countI,5));
                
                IncData(countI,7)=(fxycMS(usedT(i2),1,used(i))-fxycMS(usedT(1),1,used(i)))/(fxycMS(M,1,used(i))-fxycMS(usedT(1),1,used(i)));
            end
            if usedT(i2)>=M && M~=usedT(end)
                countD=countD+1;
                DecData(countD,1)=fxycMS(usedT(i2),1,used(i));
                DecData(countD,2)=fxycMS(usedT(end),1,used(i))-fxycMS(usedT(1),1,used(i));
                DecData(countD,3)=fxycMS(usedT(i2),5,used(i));
                
                DecData(countD,4)=fxycMS(usedT(i2),9,used(i));%/MA;
                DecData(countD,5)=fxycMS(usedT(i2),6,used(i))/MC;
                DecData(countD,6)=log(DecData(countD,4)/DecData(countD,5));
                
                DecData(countD,7)=-(fxycMS(usedT(i2),1,used(i))-fxycMS(M,1,used(i)))/(fxycMS(M,1,used(i))-fxycMS(usedT(end),1,used(i)));
            end
        end
        
    end
end