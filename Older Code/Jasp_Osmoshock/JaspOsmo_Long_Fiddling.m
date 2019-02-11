EC=1;
load('E:\CME Superfolder\CME Data\190206_JaspOsmo\Day3\orig_movies\jo_1m_long_006_c1.mat')
[C,L,T]=fxyc2CLT(Threshfxyc);
ltf=PlotAverageLifetime(C,L,T,EC,0);
figure
plot(ltf)
ylabel('Average Lifetime')
xlabel('Frame #')
load('E:\CME Superfolder\CME Data\190206_JaspOsmo\Day3\orig_movies\jo_1m_long_007_c1.mat')
[C,L,T]=fxyc2CLT(Threshfxyc);
ltf=PlotAverageLifetime(C,L,T,EC,0);
figure
plot(ltf)
ylabel('Average Lifetime')
xlabel('Frame #')
load('E:\CME Superfolder\CME Data\190206_JaspOsmo\Day3\orig_movies\jo_1m_long_007_c2.mat')
[C,L,T]=fxyc2CLT(Threshfxyc);
ltf=PlotAverageLifetime(C,L,T,EC,0);
figure
plot(ltf)
ylabel('Average Lifetime')
xlabel('Frame #')
load('E:\CME Superfolder\CME Data\190206_JaspOsmo\Day3\orig_movies\o_1m_long_008_c1.mat')
[C,L,T]=fxyc2CLT(Threshfxyc);
ltf=PlotAverageLifetime(C,L,T,EC,0);
figure
plot(ltf)
ylabel('Average Lifetime')
xlabel('Frame #')