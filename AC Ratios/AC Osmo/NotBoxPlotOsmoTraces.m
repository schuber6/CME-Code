x=[];
y=[];
[Traces,MI1,SI1]=FindAllMidOsmoTraces(FXYCMS,60);
used=find(MI1>0 & SI1>0);
MI1=MI1(used);
SI1=SI1(used);
y=[y log(MI1./SI1)];
x=[x zeros(1,length(MI1))+1];
[MI2,SI2]=ReturnAllMSIntsAtFrame(FXYCMS,Traces,66);
used=find(MI2>0 & SI2>0);
MI2=MI2(used);
SI2=SI2(used);
y=[y log(MI2./SI2)];
x=[x zeros(1,length(MI2))+2];
[MI3,SI3]=ReturnAllMSIntsAtFrame(FXYCMS,Traces,72);
used=find(MI3>0 & SI3>0);
MI3=MI3(used);
SI3=SI3(used);
y=[y log(MI3./SI3)];
x=[x zeros(1,length(MI3))+3];
notBoxPlot(y,x)