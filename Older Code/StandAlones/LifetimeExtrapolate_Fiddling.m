load('E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_3s.mat')
for i=1:length(fxyc_struct)
    L(i)=length(fxyc_struct(i).Splits);
end
unsplit=find(L<=1 & [fxyc_struct.class]==3);
split=find(L>1);
%%
r=ceil(rand*length(unsplit));
figure
plot(fxyc_struct(unsplit(r)).int)
%%
r=ceil(rand*length(split));
figure
plot(fxyc_struct(split(r)).int)
%%
ss=fxyc_struct(split(r)).Splits;
INT=fxyc_struct(split(r)).int(1:ss(2));
figure
plot(fxyc_struct(split(r)).int)
hold on
plot(INT)
%%
[Lag,SQE]=AlignTraces(fxyc_struct(unsplit(r)).int,INT)
INT2=fxyc_struct(unsplit(r)).int;
figure
plot(INT)
hold on
plot((1:length(INT2))-Lag,INT2)
title(num2str(SQE))
%%

[Match,Lag,MSQE]=FindBestExtrapolation(INT,fxyc_struct);
figure
plot(INT)
hold on
plot((1:length(Match))-Lag,Match)
title(num2str(MSQE))
%%  Record all split 3s
N=0;
inds=[];
LTs=[];
for i=1:length(split)
    fxyc=fxyc_struct(split(i));
    trace_splits=[fxyc.Splits length(fxyc.frame)];
    for i2=1:length(fxyc.split_class)
        if fxyc.split_class(i2)==3
            N=N+1;
            inds=[inds ; [i i2]];
            LTs=[LTs trace_splits(i2+1)-trace_splits(i2)];
        end
    end
end
%%  Plot random match
figure
for i=1:25
    subplot(5,5,i)
r=ceil(rand*length(inds(:,1)));
fxycS=fxyc_struct(split(inds(r,1)));
FullINT=fxycS.int;
fxycS=SplitFXYC_Struct(fxycS);
INT=fxycS(inds(r,2)).int;
[Match,Lag,MSQE]=FindBestExtrapolation(INT,fxyc_struct,0);
%figure
%subplot(1,2,1)
%plot(FullINT)
%subplot(1,2,2)
plot(INT)
hold on
plot((1:length(Match))-Lag,Match)
title(num2str(MSQE))
end

%%  Match all split 3s
MatchLTs=zeros(1,length(inds(:,1)));
for r=1:length(inds(:,1))
    fxycS=fxyc_struct(split(inds(r,1)));
    FullINT=fxycS.int;
    fxycS=SplitFXYC_Struct(fxycS);
    INT=fxycS(inds(r,2)).int;
    [Match,Lag,MSQE]=FindBestExtrapolation(INT,fxyc_struct,0);
    MatchLTs(r)=length(Match);
end
%%
unsplitLTs=zeros(1,length(unsplit));
for i=1:length(unsplit)
    unsplitLTs(i)=length(fxyc_struct(unsplit(i)).frame);
end
%% Boxplots
framegap=3;
figure
C={unsplitLTs*framegap,LTs*framegap,nonzeros(MatchLTs).'*framegap};
BoxPlotCell(C)
ylabel('Lifetime (s)')
xticklabels({'Unsplit traces','Split traces','Extrapolated split traces'})
%%
framegap=3;
bins=20;
figure
C={unsplitLTs*framegap,LTs*framegap,nonzeros(MatchLTs).'*framegap};
CDFCell(C,bins)
L={'Unsplit traces','Split traces','Extrapolated split traces'};
ylabel('Frequency')
xlabel('Lifetime (s)')
legend(L,'Location','southeast')