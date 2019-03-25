%Average Good-Good, Good-Bad, Bad-Good Traces

MLGood=find(ML==3 & CME~=3);
CMEGood=find(CME==3 & ML~=3);
BothGood=find(CME==3 & ML==3);
BothBad=find(CME~=3 & ML~=3);
% MT=[Data(MLGood).T];
% CT=[Data(CMEGood).T];
% BT=[Data(BothGood).T];
% BadT=[Data(BothBad).T];
MTrace={Data(MLGood).A};
CTrace={Data(CMEGood).A};
GoodTrace={Data(BothGood).A};
BadTrace={Data(BothBad).A};
NBins=100;
plot=1;
fig=0;
YL=[0 600];
figure
subplot(2,2,1)
[Av,SD]=ScottifyAverageTrace(GoodTrace,NBins,plot,fig);
ylim(YL)
title('Good in Both')
ylabel('Intensity')
xlabel('% of trace')
subplot(2,2,2)
[Av,SD]=ScottifyAverageTrace(MTrace,NBins,plot,fig);
ylim(YL)
title('Good in Machine Learning')
subplot(2,2,3)
[Av,SD]=ScottifyAverageTrace(CTrace,NBins,plot,fig);
ylim(YL)
title('Good in cmeAnalysis')
subplot(2,2,4)
[Av,SD]=ScottifyAverageTrace(BadTrace,NBins,plot,fig);
ylim(YL)
title('Good in Neither')

%% Average traces based on classification by each classifier separately
for i=1:4
Ts{i,1}=find(ML==i);
Traces{i,1}={Data(Ts{i,1}).A};
end
for i=1:4
Ts{i,2}=find(CME==i);
Traces{i,2}={Data(Ts{i,2}).A};
end
MTrace={Data(MLGood).A};
CTrace={Data(CMEGood).A};
GoodTrace={Data(BothGood).A};
BadTrace={Data(BothBad).A};
NBins=100;
plot=1;
fig=0;
YL=[0 600];
figure
Titles={'1 by Machine Learning','2 by Machine Learning','3 by Machine Learning','4 by Machine Learning',...
    '1 by cmeAnalysis','2 by cmeAnalysis','3 by cmeAnalysis','4 by cmeAnalysis'};
for i1=1:2
    for i2=1:4
        subplot(2,4,(i1-1)*4+i2)
        [Av,SD]=ScottifyAverageTrace(Traces{i2,i1},NBins,plot,fig);
        ylim(YL)
        title(Titles{(i1-1)*4+i2})
        ylabel('Intensity')
        xlabel('% of trace')
    end
end

%% Average traces based on 2-d coordinate of classification in both classifiers
for i0=1:4
    for i=1:4
        Ts{i0,i}=find(ML==i0 & CME==i);
        Traces{i0,i}={Data(Ts{i0,i}).A};
        Titles{i0,i}=strcat(num2str(i0), ' ML, ',num2str(i),' CME');
    end
end

NBins=100;
plot=1;
fig=0;
YL=[0 600];
figure
for i1=1:4
    for i2=1:4
        subplot(4,4,(i1-1)*4+i2)
        [Av,SD]=ScottifyAverageTrace(Traces{i1,i2},NBins,plot,fig);
        ylim(YL)
        title(Titles{i1,i2})
        ylabel('Intensity')
        xlabel('% of trace')
    end
end

%%

for i=1:length(Data)
    Data(i).LT=length(Data(i).frame)*Data(i).framegap;
end
%%
clear Ts Traces plot
for i=1:4
    Ts{i,1}=find(ML==i);
    Traces{i,1}=[Data(Ts{i,1}).LT]*3;
end
for i=1:4
    Ts{i,2}=find(CME==i);
    Traces{i,2}=[Data(Ts{i,2}).LT]*3;
end
Bad=find(ML==4 & CME==4);
BT=[Data(Bad).LT]*3;
NB=3:9:210;
figure
%subplot(1,2,1)
MLH=hist(Traces{3,1},NB);
%subplot(1,2,2)
CMEH=hist(Traces{3,2},NB);
BadH=hist(BT,NB);
plot(NB,MLH/sum(MLH),'g')
hold on
plot(NB,CMEH/sum(CMEH),'b')
xlabel('Lifetime (s)')
ylabel('Frequency')
legend('Machine Learning 3s','cmeAnalysis 3s')
