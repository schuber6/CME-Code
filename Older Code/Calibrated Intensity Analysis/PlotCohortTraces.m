function PlotCohortTraces(Cs)

%figure
Ls=((0:10:50))*3;
for i=1:length(Ls)-1
    t{i}=0:Ls(i+1)/99:Ls(i+1);
    plot(t{i},Cs{i},'LineWidth',1)
    hold on
end