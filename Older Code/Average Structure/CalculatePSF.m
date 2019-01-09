file=DataWT(2).file;
fileR=DataWT(2).movieR;
fileG=DataWT(2).movieG;
load(file)
events=FirstFrameEvents_FXYCMS(FXYCMS,1);
[ASg,num]=AverageStructure_SinglePlane(1,round(events(:,2)),round(events(:,3)),fileG,7);
[ASr,num]=AverageStructure_SinglePlane(1,round(events(:,2)),round(events(:,3)),fileR,7);

cr = twoDgaussianFittingUnConstrained(ASr);
cg = twoDgaussianFittingUnConstrained(ASg);
sr=mean(cr(5:6));
sg=mean(cg(5:6));