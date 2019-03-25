function PlotCohortBars_Errors(Cs,SDs,varargin)

if length(varargin)==0
    Ls=0:10:50;

else
    Ls=varargin{1};
end
%figure
framegap=3;
Ls=Ls*framegap;
for i=1:length(Ls)-1

    BarWError(Cs,SDs)
    Leg{i}=strcat(num2str(Ls(i)),'-',num2str(Ls(i+1)),'s');
    
end
xticklabels(Leg);
xtickangle(45)
xlabel('Cohort','FontSize',18);
ylabel('Average Peak Protein #','FontSize',18)
set(gca,'linewidth',1)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)