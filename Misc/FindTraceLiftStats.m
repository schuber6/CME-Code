function [LifterLs,LifterSs,SinkerLs,SinkerSs,LifterRs,SinkerRs]=FindTraceLiftStats(Lifters,Sinkers,inds,NSTA)

LifterLs=[];
LifterSs=[];
LifterRs=[];
SinkerLs=[];
SinkerSs=[];
SinkerRs=[];
for i=1:length(Lifters)
    %T=ceil(rand*length(Lifters));
    Trace=NSTA(inds(Lifters(i))).st;
    [Frames,Slope,rsq,Leng]=IdentifyLifteringPortion(Trace);
    LifterLs=[LifterLs Leng];
    LifterSs=[LifterSs Slope];
    LifterRs=[LifterRs rsq];
end