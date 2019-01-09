function PlotRandomMSDTraces(MSD)

N=length(MSD);
figure
for i=1:9
    subplot(3,3,i)
    T=ceil(rand*N);
    
    plot(MSD{T}(:,4),'g')
    hold on
    plot(MSD{T}(:,5),'r')
end