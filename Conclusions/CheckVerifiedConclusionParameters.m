i=1;
file=DSIOfiles(i).file;
movieR=DSIOfiles(i).movieR;
movieG=DSIOfiles(i).movieG;

FrameGap=2;
load(file)
FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap); 
filetst=strcat(file(1:end-11),'_ManualConclusionCheck.mat');
load(filetst)
[FXYCMS_C,Val]=ConfirmedConclusions(tracest,FXYCMS);

%%

[Nc,Fs,~,~,MinSlope,D,R2,MM,~,Fade,Is,MinM]=CountConclusions_BySlope(FXYCMS_C,0,5,2);
[MaxD,RMSD]=DistSubParams(D);

%%

figure
usedG=find(Val==1);
usedB=find(Val==-1);
scatter(MinM(usedG),MM(usedG),'g')
hold on
scatter(MinM(usedB),MM(usedB),'r')

%%
RadB=8;
RadF=4;
figure
for i=1:length(Val)
    subplot(5,5,i)
    L=length(FXYCMS_C{i}(:,1));
    F=find(FXYCMS_C{i}(:,1)==Fs(i));
    R=max(1,F(1)-RadB):min(L,F(1)+RadF);
    plot(FXYCMS_C{i}(R,6))
    title(strcat(num2str(Val(i)),',',num2str(Fade(i))))
end