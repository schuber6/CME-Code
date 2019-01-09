function [fxycMSCohorts,MeanMaxM,MeanMaxS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMS)

FPS=1/3;
GroupSize=ceil(50*FPS);
First=ceil(30*FPS);
Last=ceil(180*FPS);
GroupMins=First:GroupSize:Last;
GroupMaxs=GroupMins+GroupSize;
Cohorts=cell(1,length(GroupMins));
fxycMSCohorts=cell(1,length(GroupMins));
NT=length(fxycMS(1,1,:));
LF=max(max(fxycMS(:,1,:)));
MaxM=[];
MaxS=[];
for i=1:NT
    used=find(fxycMS(:,1,i));
    if fxycMS(used(1),1,i)~=1 && fxycMS(used(end),1,i)~=LF
    L=length(used);
    Ls(i)=L;
    Und=find(GroupMins<=L);
    Ov=find(GroupMaxs>L);
    G=intersect(Und,Ov);
    if ~isempty(G)
        Cohorts{G(1)}=[Cohorts{G(1)} i];
    end
    MaxM=[MaxM max(fxycMS(used,9,i))];
    MaxS=[MaxS max(fxycMS(used,6,i))];
    end
end
for i=1:length(Cohorts)
    fxycMSCohorts{i}=fxycMS(:,:,Cohorts{i});
end
MeanMaxM=mean(MaxM);
MeanMaxS=mean(MaxS);
