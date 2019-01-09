function slopes = slope_finding_GlobalMaxMedianNorm(ints,frame_rate,bkgrd,varargin)
%SLOPE_FINDING Create slope field in trace structure.
%   Inputs:
%       ints: a cell array of intensity trace vectors
%       frame_rate: Frame rate of movie in seconds. Important for
%           generating as correct as possible 12s windows.
%       bkgrd: Background. This is usually the same as the input from
%           comb_run. It is subtracted from all intensity traces, since it
%           is judged to be the lowest possible recordable signal.
%   A fourth argument can be added if you want to monitor the process, but
%   the code is very fast and rarely warrants monitoring.
%   
%   Output:
%       slopes: a cell array of slope vectors
%
% Also note that non analyzed slopes are set to zero. Due to the extreme
% unlikelihood of getting a real slope of exactly zero, all zeroes are
% excluded during analysis. If you don't like this, feel free to alter the
% code and use NaNs. For some reason I can't remember, this plan wasn't
% effective for us.
%
% Josh Ferguson, Kural Group, Ohio State University, ferguson.621@osu.edu
%
if nargin == 4
    monitor = varargin{1};
else
    monitor = false;
end
prange = 12/frame_rate; %develope a frame range of 12 seconds
%we want at least points to fit the line, so if the frame rate is greater
%than 4 seconds, the frame range will increase beyond 12 seconds.
if prange<3, prange=3; end 
%originally designed to analyze data using no future knowledge, you can
%adjust the percent of the frame range that looks forward in time.
%adjusting this should change the shape of histograms, so maintain
%consistency while comparing analyses.
forwardp = .25;
front = ceil(forwardp*(prange-1)); %frames forward in time
rear = floor((1-forwardp)*(prange-1)); %frame backward in time
slopes = cell(1,length(ints));
if monitor, fprintf('Percent Complete: %3i%%',0); end
for i=1:length(ints)
    Maxs(i)=max(ints{i});
end
Above=find(Maxs>bkgrd);
MedMax=median(Maxs(Above));  %Normalize by the median of the max intensities to remove further dependence on full trace finding -Scott
for i = 1:length(ints)
    int = ints{i}; %reduce text in code.
    lint = length(int);
    intdif = zeros(lint,1); 
    if lint<=prange %if the trace is too short, skip it.
        slopes{i} = intdif;
        continue;
    end
    %this is where we perform manual least-squares fitting
    for j = (rear+1):(lint-front)
        sub = (max(1,j-rear):min(lint,(j+front)));
        %curmax = max(int)-bkgrd;
        curmax=MedMax-bkgrd;
        tmp = (int(sub)-bkgrd)/curmax;
        tmpx = sub*frame_rate;
        tmpy = tmp';
        numer = length(tmpx)*sum(tmpx.*tmpy)-sum(tmpx)*sum(tmpy);
        denom = length(tmpx)*sum(tmpx.^2)-sum(tmpx)^2;
        intdif(j) = numer/denom;
    end
    slopes{i} = intdif; %add data to existing structure.
    if monitor, fprintf('\b\b\b\b%3i%%',ceil(100*i/length(ints))); end
end
if monitor, fprintf('\b\b\b\b%3i%%\n',100); end
end