FXYCMS=FXYCMS_Real;
[Inits,Concs]=InitiationConclusionIndices_FXYCMS(FXYCMS);

[ConcsMI,ConcsSI,MI,SI]=TabulateConclusionIntensity(Inits,Concs,FXYCMS);

MI=RollingWindowAverage(MI,5,'After');
SI=RollingWindowAverage(SI,5,'After');

FSFig()
PlotConclusionIntensity_SamePlot(MI,SI,'')

FXYCMS=FXYCMS_Art;
[Inits,Concs]=InitiationConclusionIndices_FXYCMS(FXYCMS);

[ConcsMI,ConcsSI,MI,SI]=TabulateConclusionIntensity(Inits,Concs,FXYCMS);

MI=RollingWindowAverage(MI,5,'After');
SI=RollingWindowAverage(SI,5,'After');

PlotConclusionIntensity_SamePlot(MI,SI,'--')

legend('Original Movie','Time of Osmoshock','Movie with Added Background after Osmoshock')
