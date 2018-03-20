Bad=find(Dist100V>=18 | Dist100V==0);
NumBad=length(Bad);
Kept=find(Dist100V<18 & Dist100V>0);
NumKept=length(Kept);
Full=find(ML-TL<=TL*.3 & Dist100V<18 & Dist100V~=0);
NumFull=length(Full);
Partial=find(ML-TL>TL*.3 & Dist100V<18 & Dist100V~=0);
NumPartial=length(Partial);

events=[];
Cs=[];
Data=cell(1,30);
count=1;
FSFig
for i=1:10
    subplot(2,5,i)
    Data{count}=[];
    R=ceil(rand*NumBad);
    I=Bad(R);
    fxy=TraceFXY{I};
    for i2=1:length(fxy(:,1))
        events=[events ; fxy(i2,:)];
        Cs=[Cs ; [1 0 0]];
        Data{count}=[Data{count} ; [fxy(i2,:) ManI{I}(i2)]];
    end
    t=(1:length(ManI{I}))*3;
    plot(t,ManI{Bad(R)})
    count=count+1;
end
FSFig
for i=1:10
    subplot(2,5,i)
    Data{count}=[];
    R=ceil(rand*NumFull);
    I=Full(R);
    S=start(I);
    F=finish(I);
    fxy=TraceFXY{I};
    for i2=1:length(fxy(:,1))
        events=[events ; fxy(i2,:)];
        if i2>=S && i2<=F
            Cs=[Cs ; [0 1 0]];
        else
            Cs=[Cs ; [1 0 0]];
        end
        Data{count}=[Data{count} ; [fxy(i2,:) ManI{I}(i2)]];
    end
    Factor=mean(ManI{I}(S:F));
    t=(1:length(ManI{I}))*3;
    tT=(S:F)*3;
    plot(t,ManI{Full(R)})
    hold on
    plot(tT,TemplateB{I}*Factor,'g')
    count=count+1;
end
FSFig
for i=1:10
    subplot(2,5,i)
    Data{count}=[];
    R=ceil(rand*NumPartial);
    I=Partial(R);
    S=start(I);
    F=finish(I);
    fxy=TraceFXY{I};
    for i2=1:length(fxy(:,1))
        events=[events ; fxy(i2,:)];
        if i2>=S && i2<=F
            Cs=[Cs ; [0 1 0]];
        else
            Cs=[Cs ; [1 0 0]];
        end
        Data{count}=[Data{count} ; [fxy(i2,:) ManI{I}(i2)]];
    end
    Factor=mean(ManI{I}(S:F));
    t=(1:length(ManI{I}))*3;
    tT=(S:F)*3;
    plot(t,ManI{Partial(R)})
    hold on
    plot(tT,TemplateB{I}*Factor,'g')
    count=count+1;
end
file='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM\ap2_010_BS.tif';
newfile='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM\TemplateMatch_Boxes\ap2_010_BS_Box1.tif';
BoxEventsColors(file,newfile,events,Cs);