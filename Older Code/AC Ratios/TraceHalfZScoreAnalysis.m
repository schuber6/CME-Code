Zs=[];
Cont_Zs=[];

for i=1:length(FXYCMS)
    
    found=0;
    
    if FXYCMS{i}(1,4)==3 && max(FXYCMS{i}(:,1))<=120 && length(FXYCMS{i}(:,1))>=8 && length(FXYCMS{i}(:,1))<=30
        
        
        
        Red=FXYCMS{i}(:,6);
        Green=FXYCMS{i}(:,7);
        used=find(Red>0 & Green>0);
        Red=Red(used);
        Green=Green(used);
        z=CalculateZScoreOfTraceHalfs(log(Green./Red));
        zc=CalculateZScoreOfRandomHalfs(log(Green./Red));
        Zs=[Zs z];
        Cont_Zs=[Cont_Zs zc];
    end
    
end
%%
OZs=[];
OCont_Zs=[];

for i=1:length(FXYCMS)
    
    found=0;
    
    if FXYCMS{i}(1,4)==3 && min(FXYCMS{i}(:,1))>130 && length(FXYCMS{i}(:,1))>=8 && length(FXYCMS{i}(:,1))<=30
        
        
        
        Red=FXYCMS{i}(:,6);
        Green=FXYCMS{i}(:,7);
        used=find(Red>0 & Green>0);
        Red=Red(used);
        Green=Green(used);
        z=CalculateZScoreOfTraceHalfs(log(Green./Red));
        zc=CalculateZScoreOfRandomHalfs(log(Green./Red));
        OZs=[OZs z];
        OCont_Zs=[OCont_Zs zc];
    end
    
end

%%

figure
[H,xbinsH]=hist(Zs,20);
[Hc,xbinsHc]=hist(Cont_Zs,20);
plot(xbinsH,H,'r')
hold on
plot(xbinsHc,Hc,'g')
title('Control')

figure
[H,xbinsH]=hist(OZs,20);
[Hc,xbinsHc]=hist(OCont_Zs,20);
plot(xbinsH,H,'r')
hold on
plot(xbinsHc,Hc,'g')
title('Osmo')