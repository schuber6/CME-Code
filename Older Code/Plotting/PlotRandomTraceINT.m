function PlotRandomTraceINT(TraceINT,varargin)

if nargin==1
    T=1:length(TraceINT);
else
    T=varargin{1};
end
figure
for i=1:25
    subplot(5,5,i)
    R=ceil(rand*length(TraceINT(:,1)));
    plot(TraceINT(R,:))
    title(num2str(T(R)))
end