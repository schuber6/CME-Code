Edges=-2.5:1:2.5;
figure
for in=1:length(JFs_ac)
    JFs=JFs_ac{in};
    JFm=JFm_ac{in};
    
    Gs=zeros(1,length(JFs));
    sds=sqrt(var(JFs));
    for i0=1:length(JFs)
        vs=JFs(i0)/sds;
        vm=JFm(i0);
        for i=1:length(Edges)-1
            if vs>Edges(i) && vs<=Edges(i+1)
                Gs(i0)=i;
            end
        end
    end
    subplot(2,2,in)
    boxplot(JFm/sqrt(var(JFm)),Gs)
    xlim([1.5 6.5])
    ylim([-5 5])
    ylabel('AP2 cells')
    xlabel('Before Osmoshock')
end

figure
for in=1:length(JFs_cc)
    JFs=JFs_cc{in};
    JFm=JFm_cc{in};
    
    Gs=zeros(1,length(JFs));
    sds=sqrt(var(JFs));
    for i0=1:length(JFs)
        vs=JFs(i0)/sds;
        vm=JFm(i0);
        for i=1:length(Edges)-1
            if vs>Edges(i) && vs<=Edges(i+1)
                Gs(i0)=i;
            end
        end
    end
    subplot(2,2,in)
    boxplot(JFm/sqrt(var(JFm)),Gs)
    xlim([1.5 6.5])
    ylim([-5 5])
    ylabel('CALM cells')
    xlabel('Before Osmoshock')
end

figure
for in=1:length(JFs_ao)
    JFs=JFs_ao{in};
    JFm=JFm_ao{in};
    
    Gs=zeros(1,length(JFs));
    sds=sqrt(var(JFs));
    for i0=1:length(JFs)
        vs=JFs(i0)/sds;
        vm=JFm(i0);
        for i=1:length(Edges)-1
            if vs>Edges(i) && vs<=Edges(i+1)
                Gs(i0)=i;
            end
        end
    end
    subplot(2,2,in)
    boxplot(JFm/sqrt(var(JFm)),Gs)
    xlim([1.5 6.5])
    ylim([-5 5])
    ylabel('AP2 cells')
    xlabel('After Osmoshock')
end

figure
for in=1:length(JFs_co)
    JFs=JFs_co{in};
    JFm=JFm_co{in};
    
    Gs=zeros(1,length(JFs));
    sds=sqrt(var(JFs));
    for i0=1:length(JFs)
        vs=JFs(i0)/sds;
        vm=JFm(i0);
        for i=1:length(Edges)-1
            if vs>Edges(i) && vs<=Edges(i+1)
                Gs(i0)=i;
            end
        end
    end
    subplot(2,2,in)
    boxplot(JFm/sqrt(var(JFm)),Gs)
    ylim([-5 5])
    xlim([1.5 6.5])
    ylabel('CALM cells')
    xlabel('After Osmoshock')
end