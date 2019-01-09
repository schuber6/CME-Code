function [GoodData,BadData]=PullTraceData_BestCorr(fxycMS,CutoffR,osmo)

%Column Descriptions (only uses 3s because lifetimes)
%Ints are found from pixel sums - background pixel sum
%1-Lifetime
%2-Max A
%3-Max C
%4-A:C slope
%5-A:C R^2
%6-A:C intercept
%7-osmo?

h=waitbar(0,'Pulling Trace Data');
used=find(fxycMS(1,4,:)==3);
%Data=zeros(length(used),12);
countG=0;
countB=0;
for i=1:length(used)
    waitbar(i/length(used))
    usedF=find(fxycMS(:,1,used(i)));
    usedT=find(fxycMS(:,6,used(i))>0 & fxycMS(:,9,used(i))>0);
    M=find(fxycMS(:,6,used(i))==max(fxycMS(:,6,used(i))));
    MC=max(fxycMS(:,6,used(i)));
    MA=max(fxycMS(:,9,used(i)));
    if ~isempty(usedT) && length(usedT)>=10
        Mast=fxycMS(usedF,9,used(i));
        Slave=fxycMS(usedF,6,used(i));
        C=corr([Mast  Slave]);
        if C(1,2)>=CutoffR
            [slope, intercept, rsq]=LinearSlopeInterceptandR2(Mast,Slave);
                countG=countG+1;
                GoodData(countG,1)=length(usedF);
                GoodData(countG,2)=max(Mast);
                GoodData(countG,3)=max(Slave);
                GoodData(countG,4)=slope;
                GoodData(countG,5)=rsq;
                GoodData(countG,6)=intercept;
                GoodData(countG,7)=osmo;
        else
            [slope, intercept, rsq]=LinearSlopeInterceptandR2(Mast,Slave);
            countB=countB+1;
                BadData(countB,1)=length(usedF);
                BadData(countB,2)=max(Mast);
                BadData(countB,3)=max(Slave);
                BadData(countB,4)=slope;
                BadData(countB,5)=rsq;
                BadData(countB,6)=intercept;
                BadData(countB,7)=osmo;
        end
    end
end
close(h)