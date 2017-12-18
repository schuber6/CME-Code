for i=1:4
MODst{i}=cell(1,20);
% MODstnf{i}=cell(1,20);
% MODstm=cell(1,20);
% MODstm3=cell(1,20);
end
for i=1:length(NSTA)
    %if NSTA(i).class==0 
    %if max(NSTA(i).int)>1500
    for i2=1:length(NSTA(i).frame)-1
        F=NSTA(i).frame(i2);
        if NSTA(i).int(i2)>1000 %&& F<=20
            
            Section=min([ceil(F/50) 4]);
        MO=mod(NSTA(i).frame(i2),20)+1;
        STSL=NSTA(i).st(i2)-NSTA(i).st(i2+1);
%         STSLnf=NSTA(i).stSumNF(i2)-NSTA(i).stSumNF(i2+1);
%         STSLm=NSTA(i).stM(i2)-NSTA(i).stM(i2+1);
%         STSLm3=NSTA(i).stM3(i2)-NSTA(i).stM3(i2+1);
        MODst{Section}{MO}=[MODst{Section}{MO} STSL];
%         MODstnf{Section}{MO}=[MODstnf{Section}{MO} STSLnf];
%         MODstm{MO}=[MODstm{MO} STSLm];
%         MODstm3{MO}=[MODstm3{MO} STSLm3];
        end
    end
    %end
    %end
end
for i0=1:4
for i=1:20
MeMODst(i,i0)=mean(MODst{i0}{i});
% MeMODstnf(i,i0)=mean(MODstnf{i0}{i});
% MeMODstm(i)=mean(MODstm{i});
% MeMODstm3(i)=mean(MODstm3{i});
end
end
figure
for i=1:4
subplot(2,2,i)
plot(MeMODst(:,i),'b')
hold on
% plot(MeMODstnf(:,1),'g')
% plot(MeMODstm,'r')
% plot(MeMODstm3,'k')

end
Down=MeMODst(1,1);
Up=MeMODst(11,1);
flat=[2:10 12:20];
flatM=mean(MeMODst(flat,1));
flatSD=sqrt(var(MeMODst(flat,1)));
figure
bar([Up Down flatM])
somenames={'Up';'Down';'Flat'};
set(gca,'xticklabel',somenames)
