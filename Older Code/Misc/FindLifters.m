function [Lifters,Flat,Sinkers,NL,NF,NS,AL,AF,AS]=FindLifters(clusters)

Lifters=[];
Flat=[];
Sinkers=[];
NL=0;
NF=0;
NS=0;
AL=0;
AF=0;
AS=0;
LifterLs=[];
LifterSs=[];
SinkerLs=[];
SinkerSs=[];
LifterRs=[];
SinkerRs=[];
for i=1:length(clusters)
    begmax=clusters(i).ave_tr(1)+clusters(i).SD(1);
    finmin=clusters(i).ave_tr(end)-clusters(i).SD(end);
    if finmin>begmax
        Lifters=[Lifters ; clusters(i).index];
        NL=NL+clusters(i).num;
        AL=AL+(clusters(i).ave_tr(end)-clusters(i).ave_tr(1))*clusters(i).num;
        trans=find(clusters(i).ave_tr>begmax & clusters(i).ave_tr<finmin);
        [start,leng]=FindLongestRun(trans);
        x=start:start+leng-1;
        y=clusters(i).ave_tr(x);
        [slope, intercept, rsq]=LinearSlopeInterceptandR2(x,y);
        LifterLs=[LifterLs leng];
        LifterSs=[LifterSs slope];
        LifterRs=[LifterRs rsq];
    else
        begmin=clusters(i).ave_tr(1)-clusters(i).SD(1);
        finmax=clusters(i).ave_tr(end)+clusters(i).SD(end);
        if finmax<begmin
            Sinkers=[Sinkers ; clusters(i).index];
            NS=NS+clusters(i).num;
            AS=AS+(clusters(i).ave_tr(end)-clusters(i).ave_tr(1))*clusters(i).num;
            trans=find(clusters(i).ave_tr>finmax & clusters(i).ave_tr<begmin);
            [start,leng]=FindLongestRun(trans);
            x=start:start+leng-1;
            y=clusters(i).ave_tr(x);
            [slope, intercept, rsq]=LinearSlopeInterceptandR2(x,y);
            SinkerLs=[SinkerLs leng];
            SinkerSs=[SinkerSs slope];
            SinkerRs=[SinkerRs rsq];
        else
            Flat=[Flat ; clusters(i).index];
            NF=NF+clusters(i).num;
            AF=AF+(clusters(i).ave_tr(end)-clusters(i).ave_tr(1))*clusters(i).num;
        end
    end
end
AL=AL/NL;
AS=AS/NS;
AF=AF/NF;
