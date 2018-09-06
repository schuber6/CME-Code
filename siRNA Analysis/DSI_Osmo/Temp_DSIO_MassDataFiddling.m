SIRNA=find([DSIOfiles.siRNA]==1);
Control=find([DSIOfiles.siRNA]==0);
CC{1}=[DSIOfiles(Control).MedianClath];
CC{2}=[DSIOfiles(SIRNA).MedianClath];
figure
BoxPlotCell(CC)

%%

Claths=[DSIOfiles.MedianClath]/10^4;
Concs=[DSIOfiles.ConcsPerArea];
figure
scatter(Claths,Concs)
hold on
thresh=0;
used=find(Claths>=thresh);
AddLinearRegLine(Claths(used),Concs(used))
scatter(Claths(used),Concs(used),'g')
%After MedClath~10^4, these are independent

%%

Claths=[DSIOfiles.MedianCALM];
Concs=[DSIOfiles.GRSDclath];
figure
scatter(Claths,Concs)


%%

fs={DSIOfiles(1:4).file};