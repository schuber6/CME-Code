Cr=Clathwt{2};
Cg=CALMwt{2};
figure
for i=1:9
    subplot(3,3,i)
    T=ceil(rand*length(Cr{1}));
    for i2=1:length(Cr)
        r(i2)=Cr{i2}(T);
        g(i2)=Cg{i2}(T);
    end
    plot(r/max(r),'r')
    hold on
    plot(g/max(g),'g')
end

%%

Cr=Clathsi{2};
Cg=CALMsi{2};
figure
for i=1:9
    subplot(3,3,i)
    T=ceil(rand*length(Cr{1}));
    for i2=1:length(Cr)
        r(i2)=Cr{i2}(T);
        g(i2)=Cg{i2}(T);
    end
    plot(r/max(r),'r')
    hold on
    plot(g/max(g),'g')
end

%%

Cr=Clathdsi{2};
Cg=CALMdsi{2};
figure
for i=1:9
    subplot(3,3,i)
    T=ceil(rand*length(Cr{1}));
    for i2=1:length(Cr)
        r(i2)=Cr{i2}(T);
        g(i2)=Cg{i2}(T);
    end
    plot(r/max(r),'r')
    hold on
    plot(g/max(g),'g')
end