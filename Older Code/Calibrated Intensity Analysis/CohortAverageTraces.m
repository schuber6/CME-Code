function [Cs,varargout]=CohortAverageTraces(AC,varargin)

if length(varargin)==0
    N=1;
else
    N=varargin{1};
    if length(varargin)>1
        Ls=varargin{2};
    else
        Ls=0:10:50;
    end
end

NBins=100;

lens=zeros(1,length(AC));
for i=1:length(AC)
    lens(i)=length(AC{i});
end
for i=1:length(Ls)-1
    used=find(lens>=Ls(i) & lens<Ls(i+1));
    ACoh{i}=AC(used);
    Num(i)=length(used);
end
for i=1:length(Ls)-1
    SCoh{i}=zeros(length(ACoh{i}),NBins);
    MCoh{i}=zeros(1,length(ACoh{i}));
    for i2=1:length(ACoh{i})
        STrace=ScottifyTrace(ACoh{i}{i2}/N,NBins);
        SCoh{i}(i2,:)=STrace;
        MCoh{i}(i2)=max(ACoh{i}{i2})/N;
    end
    Cs{i}=mean(SCoh{i});
    SDs{i}=std(SCoh{i});
    SEs{i}=std(SCoh{i})/sqrt(Num(i));
    MCs(i)=mean(MCoh{i});
    MSDs(i)=std(MCoh{i});
    MSEs(i)=std(MCoh{i})/sqrt(Num(i));
end
varargout{1}=SDs;
varargout{2}=Num;
varargout{3}=SEs;
varargout{4}=MCs;
varargout{5}=MSDs;
varargout{6}=MSEs;