fold='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo\170520_Analysis\movies';
%fold='E:\CME Superfolder\CME Data\170907_CALM_CLCa_1StackOsmo';
reg='*002*Linked*';
%reg='*005_GFP*Linked*';
files=FindFiles(fold,reg);
binamp=500;
maxG=5;
figure
for i0=1:length(files)
    load(files{i0})
    used=find([NSTAms.sint]);
    Ms=[];
    Ss=[];
    Gs=[];
    for i=1:length(used)
        Ms=[Ms NSTAms(used(i)).int(1)];
        Ss=[Ss NSTAms(used(i)).sint(1)];
        Gs=[Gs ceil(NSTAms(used(i)).sint(1)/binamp)];
    end
    for i=1:maxG
        used2=find(Gs==i);
        Mes(i)=mean(Ms(used2));
        Ges(i)=i;
    end
    subplot(3,3,i0)
    boxplot(Ms,Gs)
    hold on
    %     AddLinearRegLine_Color(Ss/binamp,Ms,[1 0 0])
    %     if i0~=1
    %         AddLinearRegLine_Color(SsL/binamp,MsL,[0 0 1])
    %     end
    if i0~=1
        AddLinearRegLine_Color_0Intercept(GesL,MesL,[0 0 1])
    end
    AddLinearRegLine_Color_0Intercept(Ges,Mes,[1 0 0])
    
    xlim([0 maxG])
    ylim([0 5000])
    MsL=Ms;
    SsL=Ss;
    MesL=Mes;
    GesL=Ges;
end