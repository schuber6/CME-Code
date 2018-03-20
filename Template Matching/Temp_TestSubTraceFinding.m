clear Template Dist100V TL ML
framegap=3;
for i=1:6
    A=SCell{i};
    Template{i}=StatCell(A,'mean_assumezeros');
    Template{i}=Template{i}/mean(Template{i});
end
Template=MakeIntermediateLengthTemplates(Template,3);
count=1;
score=zeros(1,length(ManI));
start=zeros(1,length(ManI));
finish=zeros(1,length(ManI));
TemplateB=cell(1,length(ManI));

for i=1:length(ManI)
    FT=ManI{i};
    score(i)=0;
    start(i)=0;
    finish(i)=0;
    TemplateB{i}=[];
    for i2=1:length(Template)
        [sc1,st1,fi1,T1]=TemplateMatch_ScoreTraceSections_chisq(Template{i2},FT,framegap);
        if sc1~=0 && (score(i)==0 || sc1<=score(i))
            score(i)=sc1;
            start(i)=st1;
            finish(i)=fi1;
            TemplateB{i}=T1;
        end
    end
end
TL=StatCell(TemplateB,'length');
figure
hist(nonzeros(TL),30)
%score=StatCell(scoreC,'min');

SS=sort(nonzeros(score));
clear Tinds
    used=find(score);
for i=1:length(used)


    Cind=used(i);
    startB=start(Cind);
    finishB=finish(Cind);
    
    inds=startB:finishB;
    FT=ManI{Cind};
    minitrace=FT(inds);
    Factor=mean(minitrace);
    t=(1:length(FT))*framegap;

    Tinds{i}=(startB:finishB)*framegap;
    Temp{i}=TemplateB{Cind};
    Real=minitrace/mean(minitrace);
    Est=TemplateB{Cind};
    SReal=ScottifyTrace(Real,100);
    SEst=ScottifyTrace(Est,100);
    Dist100V(used(i))=sum(abs(SReal-SEst));

    TL(used(i))=length(TemplateB{Cind});
    ML(used(i))=length(FT);
end

FSFig
for i=1:25
    subplot(5,5,i)
    Cind=find(score==SS(i),1,'first');
    startB=start(Cind);
    finishB=finish(Cind);
    
    inds=startB:finishB;
    FT=ManI{Cind};
    minitrace=FT(inds);
    Factor=mean(minitrace);
    t=(1:length(FT))*framegap;
    plot(t,FT)
    hold on
    Tinds{i}=(startB:finishB)*framegap;
    Temp{i}=TemplateB{Cind};
    plot(Tinds{i},TemplateB{Cind}*Factor,'g')
    title(num2str(Dist100V(Cind)))
    %TL(i)=length(TemplateB{Cind});
    %title(num2str(SS(i)))
end
FSFig
for i=1:25
    subplot(5,5,i)
    used=find(score);
    Cind=used(i);
    startB=start(Cind);
    finishB=finish(Cind);
    
    inds=startB:finishB;
    FT=ManI{Cind};
    minitrace=FT(inds);
    Factor=mean(minitrace);
    t=(1:length(FT))*framegap;
    plot(t,FT)
    hold on
    Tinds{i}=(startB:finishB)*framegap;
    Temp{i}=TemplateB{Cind};
    plot(Tinds{i},TemplateB{Cind}*Factor,'g')
    %TL(used(i))=length(TemplateB{Cind});
    %ML(used(i))=length(FT);
    title(num2str(Dist100V(Cind)))
end
