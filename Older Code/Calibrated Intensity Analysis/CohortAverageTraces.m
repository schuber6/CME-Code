function Cs=CohortAverageTraces(AC,varargin)

if length(varargin)==0
    N=1;
else
    N=varargin{1};
end

NBins=100;
Ls=0:10:50;
lens=zeros(1,length(AC));
for i=1:length(AC)
    lens(i)=length(AC{i});
end
for i=1:length(Ls)-1
    used=find(lens>=Ls(i) & lens<Ls(i+1));
    ACoh{i}=AC(used);
end
for i=1:length(Ls)-1
    SCoh{i}=zeros(length(ACoh{i}),NBins);
    for i2=1:length(ACoh{i})
        STrace=ScottifyTrace(ACoh{i}{i2}/N,NBins);
        SCoh{i}(i2,:)=STrace;
    end
    Cs{i}=mean(SCoh{i});
end