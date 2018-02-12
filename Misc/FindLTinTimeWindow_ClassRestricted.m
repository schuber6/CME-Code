function LT=FindLTinTimeWindow_ClassRestricted(fxycS,start,finish,framegap,OnesAndTwos)

LTs=[];
for i=1:length(fxycS)
    if fxycS(i).class==3 || (OnesAndTwos && (fxycS(i).class==1 || fxycS(i).class==2))
        used=find(fxycS(i).frame>=start & fxycS(i).frame<finish);
        if ~isempty(used)
        LTs=[LTs ; fxycS(i).lt*framegap];
        end
    end
end
LT=mean(LTs);
