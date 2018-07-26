figure
bar([5,2,1.5])
sigstar({[1,2], [1,3]})

%%
figure
    bar([5,2,1.5])
    sigstar({[2,3],[1,2], [1,3]},[nan,0.05,0.05])
    
    %%
    figure
        R=randn(30,2);
    R(:,1)=R(:,1)+3;
    boxplot(R)
    set(gca,'XTick',1:2,'XTickLabel',{'A','B'})
    H=sigstar({{'A','B'}},0.01);
    ylim([-3,6.5])
    set(H,'color','r')
    
    %%
    figure
        x=[1,2,3,2,1];
    subplot(1,2,1)
    bar(x)
    sigstar({[1,2], [2,3], [4,5]})
    subplot(1,2,2)
    bar(x)
    sigstar({[2,3],[1,2], [4,5]})