for i=1:length(FXYCMS)
    LT(i)=length(FXYCMS{i}(:,1));
end
plaques=find(LT>=100);

%%

R=ceil(rand*length(plaques));
I=plaques(R);
fxyc=FXYCMS{I};
figure
M=RollingWindowAverage(fxyc(:,6),5,'After');
S=RollingWindowAverage(fxyc(:,7),5,'After');
% plot(fxyc(:,1),fxyc(:,6),'r')
% hold on
% plot(fxyc(:,1),fxyc(:,7),'g')
plot(M,'r')
hold on
plot(S,'g')

%%

folder='E:\CME Superfolder\CME Data\180512_SUM_CALM_AP2_Control\Isolated Cells\Split Channels';
files=FindFiles(folder,'*008*Green*');
ManualAnalysis_FXYCMS_Traces(FXYCMS,19,files{1})