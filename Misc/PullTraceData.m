function Data=PullTraceData(fxycMS)

%Column Descriptions (only uses 3s because lifetimes)
%Ints are found from pixel sums - background pixel sum
%1-First Frame
%2-Last Frame
%3-Lifetime (frames)
%4-Max master int
%5-Max slave int
%6-log(4/5)
%7-initial master int
%8-initial slave int
%9-log(7/8)
%10-final master int
%11-final slave int
%12-log(10/11)
%13-Initial master rate
%14-Initial slave rate
%15-Final master rate
%16-Final slave rate

used=find(fxycMS(1,4,:)==3);
%Data=zeros(length(used),12);
count=0;
for i=1:length(used)
    usedT=find(fxycMS(:,6,used(i))>0 & fxycMS(:,9,used(i))>0);
    if ~isempty(usedT) && length(usedT)>=10
        count=count+1;
        Data(count,1)=fxycMS(usedT(1),1,used(i));
        Data(count,2)=fxycMS(usedT(end),1,used(i));
        Data(count,3)=Data(count,2)-Data(count,1);
        
        Data(count,4)=max(fxycMS(:,6,used(i)));
        Data(count,5)=max(fxycMS(:,9,used(i)));
        Data(count,6)=log(Data(count,4)/Data(count,5));
        
        Data(count,7)=fxycMS(usedT(1),6,used(i));
        Data(count,8)=fxycMS(usedT(1),9,used(i));
        Data(count,9)=log(Data(count,7)/Data(count,8));
        
        Data(count,10)=fxycMS(usedT(end),6,used(i));
        Data(count,11)=fxycMS(usedT(end),9,used(i));
        Data(count,12)=log(Data(count,10)/Data(count,11));
        
        Data(count,13)=(fxycMS(usedT(2),6,used(i))-fxycMS(usedT(1),6,used(i)))/(fxycMS(usedT(2),1,used(i))-fxycMS(usedT(1),1,used(i)));
        Data(count,14)=(fxycMS(usedT(2),9,used(i))-fxycMS(usedT(1),9,used(i)))/(fxycMS(usedT(2),1,used(i))-fxycMS(usedT(1),1,used(i)));
        
        Data(count,15)=(fxycMS(usedT(end),6,used(i))-fxycMS(usedT(end-1),6,used(i)))/(fxycMS(usedT(end),1,used(i))-fxycMS(usedT(end-1),1,used(i)));
        Data(count,16)=(fxycMS(usedT(end),9,used(i))-fxycMS(usedT(end-1),9,used(i)))/(fxycMS(usedT(end),1,used(i))-fxycMS(usedT(end-1),1,used(i)));
    end
end