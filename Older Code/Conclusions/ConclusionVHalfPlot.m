function Y=ConclusionVHalfPlot(files,Areas)

FrameGap=2;
MaxFrame=151;
Tmast=3000;
Tslave=0;
AvWindow=30;
MinLTF=30/FrameGap;
EdgesF=1:30:151; 
for i=1:length(EdgesF)-1
    Cent(i)=mean([EdgesF(i) EdgesF(i+1)]);
end

for i=1:length(files)
    clear Fs Yc
    for i2=1:length(files{i})
        load(files{i}{i2})
        [Nc,Fs{i2}]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap);
    end
    
    for i2=1:length(Fs)
        Yc{i}{i2}(1)=length(find(Fs{i2}>15 & Fs{i2}<75));
        Yc{i}{i2}(2)=length(find(Fs{i2}>75 & Fs{i2}<135));
        Yc{i}{i2}=Yc{i}{i2}/Areas{i}(i2);
    end
    Y{i}=Yc{i}{1};
    for i2=2:length(Yc{i})
        Y{i}=Y{i}+Yc{i}{i2};
    end
    Y{i}=Y{i}/length(Yc{i});
end

Cent=[0 150];
figure
bar(Cent-max(Cent),Y{1},.1,'g')
hold on
bar(Cent-max(Cent)+20,Y{4},.1,'b')
hold on
bar(Cent-min(Cent)+210,Y{2},.1,'g')
hold on
bar(Cent-min(Cent)+210+20,Y{5},.1,'b')
hold on
bar(Cent-min(Cent)+630,Y{3},.1,'g')
hold on
bar(Cent-min(Cent)+630+20,Y{6},.1,'b')
hold on
