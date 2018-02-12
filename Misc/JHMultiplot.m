frames=max(JOSHF)+1;
N=12;
abs=.2;
Nbins=100;
SDs=zeros(1,N);
NSDs=zeros(1,N);
Ms=zeros(1,N);
V=cell(1,N);
for i=1:N
    
    subplot(ceil(sqrt(N)),ceil(sqrt(N)),i)
    %subplot(4,8,i)
    start=(i-1)*frames/N+1;
    finish=i*frames/N;
    JOSHs=RestrictJOSHSlopes(JOSH0,JOSHF,start,finish);
    NiceH=find(JOSHs>-.2);
    NiceL=find(JOSHs<.2);
    Nice=intersect(NiceH,NiceL);
    NSDs(i)=sqrt(var(nonzeros(JOSHs(Nice))));
    SDs(i)=sqrt(var(nonzeros(JOSHs)));
    Ms(i)=mean(nonzeros(JOSHs));
    xbins=JHBins(Nbins,abs);
    V{i}=hist(nonzeros(JOSHs),xbins);
    bar(xbins,V{i}/sum(V{i}))
    %hist(nonzeros(JOSHs),xbins)
    hold on
    
    %V{i}(1)=0;
    %V{i}(length(V{i}))=0;
    ylim([0 .07])
    xlim([-1*abs abs])
end
figure
plot(SDs)
figure
plot(Ms)
figure
plot(NSDs)