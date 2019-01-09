Edges=-100:5:100;
Gs=zeros(1,length(JFs_ac));
for i0=1:length(JFs_ac)
    vs=JFs_ac(i0);
    vm=JFm_ac(i0);
    for i=1:length(Edges)-1
        if vs>Edges(i) && vs<=Edges(i+1)
            Gs(i0)=i;
        end
    end
end
figure
subplot(2,2,1)
boxplot(JFm_ac,Gs)
ylim([-200 200])

Edges=-100:5:100;
Gso=zeros(1,length(JFs_ao));
for i0=1:length(JFs_ao)
    vs=JFs_ao(i0);
    vm=JFm_ao(i0);
    for i=1:length(Edges)-1
        if vs>Edges(i) && vs<=Edges(i+1)
            Gso(i0)=i;
        end
    end
end
subplot(2,2,2)
boxplot(JFm_ao,Gso)
ylim([-200 200])

Gs=zeros(1,length(JFs_cc));
for i0=1:length(JFs_cc)
    vs=JFs_cc(i0);
    vm=JFm_cc(i0);
    for i=1:length(Edges)-1
        if vs>Edges(i) && vs<=Edges(i+1)
            Gs(i0)=i;
        end
    end
end
subplot(2,2,3)
boxplot(JFm_cc,Gs)
ylim([-200 200])


Gso=zeros(1,length(JFs_co));
for i0=1:length(JFs_co)
    vs=JFs_co(i0);
    vm=JFm_co(i0);
    for i=1:length(Edges)-1
        if vs>Edges(i) && vs<=Edges(i+1)
            Gso(i0)=i;
        end
    end
end
subplot(2,2,4)
boxplot(JFm_co,Gso)
ylim([-200 200])