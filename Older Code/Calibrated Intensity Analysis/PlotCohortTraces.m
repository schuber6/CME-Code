function PlotCohortTraces(Cs,varargin)

if length(varargin)==0
    Ls=0:10:50;
else
    Ls=varargin{1};
end
%figure
framegap=3;
Ls=Ls*framegap;
for i=1:length(Ls)-1
    t{i}=0:Ls(i+1)/99:Ls(i+1);
    plot(t{i},Cs{i},'LineWidth',1)
    hold on
end