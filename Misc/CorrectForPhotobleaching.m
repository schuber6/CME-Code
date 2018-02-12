function NSTA=CorrectForPhotobleaching(NSTA)
%Finds mean intensity of master and slave for every 20 frame window, and
%then normalizes intensity to make all means equal to the first mean


M=maxframeNSTA(NSTA);
Groups=floor(M/20);
Ints=cell(2,M);
CorrectionM=zeros(1,M);
CorrectionS=zeros(1,M);
for i=1:length(NSTA)
    for i2=1:length(NSTA(i).frame)
        F=NSTA(i).frame(i2);
        IM=NSTA(i).int(i2);
        IS=NSTA(i).SlaveBS(i2);
        Ints{1,F}=[Ints{1,F} IM];
        Ints{2,F}=[Ints{2,F} IS];
    end
end
Spacing=floor(M/Groups);
for i=1:Groups
    GS(i)=Spacing*(i-1)+1;
    GE(i)=Spacing*i;
end

% for i=1:M
%     MedM(i)=median(Ints{1,i});
%     MedS(i)=median(Ints{2,i});
%     MeanM(i)=mean(Ints{1,i});
%     MeanS(i)=mean(Ints{2,i});
% end
for i=1:Groups
    IsM=[];
    IsS=[];
    for i2=GS(i):GE(i)
        IsM=[IsM Ints{1,i2}];
        IsS=[IsS Ints{2,i2}];
    end
    MedM(i)=median(IsM);
    MedS(i)=median(IsS);
    MeanM(i)=mean(IsM);
    MeanS(i)=mean(IsS);
    for i2=GS(i):GE(i)
        CorrectionM(i2)=MeanM(1)/MeanM(i);
        CorrectionS(i2)=MeanS(1)/MeanS(i);
    end
end
for i=1:length(NSTA)
    for i2=1:length(NSTA(i).frame)
        F=NSTA(i).frame(i2);
        IM=NSTA(i).int(i2);
        IS=NSTA(i).SlaveBS(i2);
        NSTA(i).int_PB(i2)=NSTA(i).int(i2)*CorrectionM(F);
        NSTA(i).SlaveBS_PB(i2)=NSTA(i).SlaveBS(i2)*CorrectionS(F);
    end
end

