[Titles2,Lts2,MMs2,MSs2,MIs2,SIs2,MSratio2,MSratioLog2,Mslopes2,Sslopes2]=siRNA_boxplots_F();
for i=1:length(Titles2)
    Titles{length(Titles)+1}=Titles2{i};
end
for i=1:length(Lts2)
    LTs{length(LTs)+1}=Lts2{i};
    MMs{length(MMs)+1}=MMs2{i};
    MSs{length(MSs)+1}=MSs2{i};
    MIs{length(MIs)+1}=MIs2{i};
    SIs{length(SIs)+1}=SIs2{i};
    MSratio{length(MSratio)+1}=MSratio2{i};
    MSratioLog{length(MSratioLog)+1}=MSratioLog2{i};
    Mslopes{length(Mslopes)+1}=Mslopes2{i};
    Sslopes{length(Sslopes)+1}=Sslopes2{i};
end

%%

Titles{length(Titles)+1}='siRNA osmoshock';

for i=1:2
    
end