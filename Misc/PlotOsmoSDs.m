a=SDs;
E1=[15 4 3 5];
E2=[16 6 7];
E3=[17 8 9];
E4=[18 10 11 12 13 14];
T1=[-2 5 6 11];
T2=[-1 5 10];
T3=[-2 5 11];
T4=[-1 1 2 3 5 10];
plot(T1,SDs(E1))
hold on
plot(T2,SDs(E2))
plot(T3,SDs(E3))
plot(T4,SDs(E4))
ylabel('Growth Rate Standard Deviation')
xlabel('Time From Osmoshock')
title('Only 9 Frame')
