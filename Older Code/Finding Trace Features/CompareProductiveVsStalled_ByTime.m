function CompareProductiveVsStalled_ByTime(FXYCMS)

FrameGap=2;
FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap);
[FXYCMS_S,Value,Slopes]=SelectStallsByJoshSlopes(FXYCMS);
[Nc,Fs,FXYCMS_P]=CountConclusions_BySlope(FXYCMS,3000,15,FrameGap,60);

MI_S=zeros(1,length(FXYCMS_S));
SI_S=zeros(1,length(FXYCMS_S));
for i=1:length(FXYCMS_S)
    fxyc=FXYCMS_S{i};
    MI_S(i)=max(fxyc(:,6));
    SI_S(i)=max(fxyc(:,7));
end
AC_S=SI_S./MI_S;

MI_P=zeros(1,length(FXYCMS_P));
SI_P=zeros(1,length(FXYCMS_P));
F_P=zeros(1,length(FXYCMS_P));
for i=1:length(FXYCMS_P)
    fxyc=FXYCMS_P{i};
    MI_P(i)=max(fxyc(:,6));
    SI_P(i)=max(fxyc(:,7));
    F_P(i)=Fs(i);
end
MF=max(F_P);
Edges=[1 MF/2 MF+1];

[Xm,N,Em]=AverageByFrame(MI_P,F_P,Edges);
[Xs,~,Es]=AverageByFrame(SI_P,F_P,Edges);

FSFig;
subplot(1,3,1)
plot(Edges(1:end-1),N)
subplot(1,3,2)
errorbar(Edges(1:end-1),Xm/max(Xm),Em/max(Xm))
subplot(1,3,3)
errorbar(Edges(1:end-1),Xs/max(Xs),Es/max(Xs))


% AC_P=SI_P./MI_P;
% L={strcat('Productive Spots. N=',num2str(length(MI_P))),strcat('Stalled Spots. N=',num2str(length(MI_S)))};
% 
% if fig
% FSFig
% end
% subplot(Sy,Sx,Sis(1))
% BoxPlotCell({MI_P, MI_S})
% xticklabels(L)
% subplot(Sy,Sx,Sis(2))
% BoxPlotCell({SI_P, SI_S})
% xticklabels(L)
% subplot(Sy,Sx,Sis(3))
% BoxPlotCell({AC_P, AC_S})
% xticklabels(L)
% 
% M=median(AC_P);
% AC_S_rel=AC_S/M;

