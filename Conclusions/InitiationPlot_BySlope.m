function [Ncwt,Ncsi]=InitiationPlot_BySlope(fileswt,filessi,Area_WT,Area_SI,ylab,sig,Tmast,varargin)

FrameGap=2;
MaxFrame=151;
%Tmast=3000;
Tslave=0;
MinLTF=30/FrameGap;

for i0=1:length(fileswt)
    load(fileswt{i0});
    [Ncwt(i0)]=CountInitiations_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
    Ncwt(i0)=Ncwt(i0)/Area_WT(i0);
end
Navc(1)=mean(Ncwt);
Navsd(1)=sqrt(var(Ncwt))/sqrt(length(Ncwt));

for i0=1:length(filessi)
    load(filessi{i0});
    [Ncsi(i0)]=CountInitiations_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
    Ncsi(i0)=Ncsi(i0)/Area_SI(i0);
end
Navc(2)=mean(Ncsi);
Navsd(2)=sqrt(var(Ncsi))/sqrt(length(Ncsi));



% figure
% bar([Niwt.' Ncwt.']/5)
% figure
Obj=bar([Navc.']/5);
hold on
errorbar([1 2],Navc/5,Navsd/5,'.')
if length(varargin)>=1
    ylim(varargin{1})
end
if sig
    %[~,p]=ttest2(Ncwt,Ncsi);
    [~,p]=kstest2(Ncwt,Ncsi);
    if p>.05
        p=nan;
    end
    sigstar([1 2],p)
end
%L={'0-45s Pits','45-90s Pits','90-135s Pits','Stalled Structures'};
%legend(fliplr(Obj),fliplr(L));
if ylab
ylabel('Internalizations/um^2/min')
end
%ylim([0 1])
xticklabels({'WT','SI'})