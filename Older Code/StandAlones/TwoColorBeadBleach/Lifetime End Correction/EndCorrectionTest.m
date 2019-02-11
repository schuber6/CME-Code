%Example how Lifetime end correction works
%First section similates N traces of random length randomly distributed
%throughout a simulated movie of MF frames.

N=100000;
MF=50;
MFt=(MF+2*30)-30;

C=[];       %Stores trace categories (whether it hits the end of the movie or not)
L=[];       %Stores lifetime
T=[];       %Stores frame number
lts=[];
ind=1;
for i=1:N    %Simulate lifetimes
    S=ceil(rand*(MF+2*30))-30;
    LT=ceil(rand*20);  %+ceil(rand*S/MFt*10);  %Can add this term to make the average lifetime change over time
    lts(i)=LT;
    E=S+LT-1;
    Color=3;
    if S<=1
        Color=6;
        S=1;
    end
    if E>=MF
        Color=5;
        E=MF;
    end
    Lif=E-S+1;
    for i2=S:E
        C(ind)=Color;
        L(ind)=Lif;
        T(ind)=i2;
        ind=ind+1;
    end
end

ltf=PlotAverageLifetime(C,L,T,1,0);
plot(ltf,'g')
hold on
figure
ltf=PlotAverageLifetime(C,L,T,0,0);
plot(ltf,'r')
ylim([0 20])
ylabel('Average Lifetime (frames)')
xlabel('Frame #')
legend('End-corrected calculation','Excluding data that hits movie ends')