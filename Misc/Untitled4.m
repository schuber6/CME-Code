F=Fra;
E1=[];
E2=[];
E3=[];
T1=[];
T2=[];
T3=[];
L1=[];
L2=[];
L3=[];
I1=[];
I2=[];
I3=[];
C1=[];
C2=[];
C3=[];
LE1=[];
LE2=[];
LE3=[];
BinSpacing=10*3/60;
StartTime=-5;
F=Fra;
for i=1:length(nonzeros(SD(2,:)))
    E1=[E1 SD(2,i)];
    L1=[L1 LTT(2,i)];
    LE1=[LE1 LTECMA(2,i)];
    T1=[T1 F(2,i)*3/60+StartTime];
    I1=[I1 I(2,i)];
    C1=[C1 C(2,i)];
end
for i=1:length(nonzeros(SD(4,:)))
    E2=[E2 SD(4,i)];
    T2=[T2 F(4,i)*3/60+StartTime];
    L2=[L2 LTT(4,i)];
    LE2=[LE2 LTECMA(4,i)];
    I2=[I2 I(4,i)];
    C2=[C2 C(4,i)];
end
for i=1:length(nonzeros(SD(6,:)))
    E3=[E3 SD(6,i)];
    T3=[T3 F(6,i)*3/60+StartTime];
    L3=[L3 LTT(6,i)];
     LE3=[LE3 LTECMA(6,i)];
    I3=[I3 I(6,i)];
    C3=[C3 C(6,i)];
end

for i=1:length(nonzeros(SD(1,:)))
    E1=[E1 SD(1,i)];
    T1=[T1 F(1,i)*3/60+65];
    L1=[L1 LTT(1,i)];
    LE1=[LE1 LTECMA(1,i)];
    I1=[I1 I(1,i)];
    C1=[C1 C(1,i)];
end
for i=1:length(nonzeros(SD(3,:)))
    E2=[E2 SD(3,i)];
    T2=[T2 F(3,i)*3/60+53];
    L2=[L2 LTT(3,i)];
    LE2=[LE2 LTECMA(3,i)];
    I2=[I2 I(3,i)];
    C2=[C2 C(3,i)];
end
for i=1:length(nonzeros(SD(5,:)))
    E3=[E3 SD(5,i)];
    T3=[T3 F(5,i)*3/60+44];
    L3=[L3 LTT(5,i)];
    LE3=[LE3 LTECMA(5,i)];
    I3=[I3 I(5,i)];
    C3=[C3 C(5,i)];
end

plot(T1,E1)
hold on
plot(T2,E2)
plot(T3,E3)
xlabel('Time From Deoxycholate (min)')
ylabel('Growth Rate Standard Deviation')

figure

plot(T1,L1)
hold on
plot(T2,L2)
plot(T3,L3)
plot(T1,LE1,'r')
hold on
plot(T2,LE2,'r')
plot(T3,LE3,'r')
xlabel('Time From Deoxycholate (min)')
ylabel('Mean Lifetime')

figure

plot(T1,I1)
hold on
plot(T2,I2)
plot(T3,I3)
xlabel('Time From Deoxycholate (min)')
ylabel('Initiation Density (#/um^2*s)')

figure

plot(T1,C1)
hold on
plot(T2,C2)
plot(T3,C3)
xlabel('Time From Deoxycholate (min)')
ylabel('Conclusion Density (#/um^2*s)')