figure
Edges=-3:.1:3;
Gs=zeros(1,length(JFs_ac));
sds=sqrt(var(JFs_ac));
for i0=1:length(JFs_ac)
    vs=JFs_ac(i0)/sds;
    vm=JFm_ac(i0);
    for i=1:length(Edges)-1
        if vs>Edges(i) && vs<=Edges(i+1)
            Gs(i0)=i;
        end
    end
end
subplot(2,2,1)
boxplot(JFm_ac/sqrt(var(JFm_ac)),Gs)
ylim([-5 5])
ylabel('AP2 cells')
xlabel('Before Osmoshock')

Edges=-3:.1:3;
Gs=zeros(1,length(JFs_ao));
sds=sqrt(var(JFs_ao));
for i0=1:length(JFs_ao)
    vs=JFs_ao(i0)/sds;
    vm=JFm_ao(i0);
    for i=1:length(Edges)-1
        if vs>Edges(i) && vs<=Edges(i+1)
            Gs(i0)=i;
        end
    end
end
subplot(2,2,2)
boxplot(JFm_ao/sqrt(var(JFm_ao)),Gs)
ylim([-5 5])
xlabel('After Osmoshock')

Edges=-3:.1:3;
Gs=zeros(1,length(JFs_cc));
sds=sqrt(var(JFs_cc));
for i0=1:length(JFs_cc)
    vs=JFs_cc(i0)/sds;
    vm=JFm_cc(i0);
    for i=1:length(Edges)-1
        if vs>Edges(i) && vs<=Edges(i+1)
            Gs(i0)=i;
        end
    end
end
subplot(2,2,3)
boxplot(JFm_cc/sqrt(var(JFm_cc)),Gs)
ylim([-5 5])
ylabel('CALM cells')

Edges=-3:.1:3;
Gs=zeros(1,length(JFs_co));
sds=sqrt(var(JFs_co));
for i0=1:length(JFs_co)
    vs=JFs_co(i0)/sds;
    vm=JFm_co(i0);
    for i=1:length(Edges)-1
        if vs>Edges(i) && vs<=Edges(i+1)
            Gs(i0)=i;
        end
    end
end
subplot(2,2,4)
boxplot(JFm_co/sqrt(var(JFm_co)),Gs)
ylim([-5 5])